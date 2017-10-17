/**
 * 
 */
package com.cf.utils.validator;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.cf.secruity.AuthenticationFailureHandler;
import com.cf.utils.RRException;
import com.google.code.kaptcha.Constants;

/**
 * 校验验证码的过滤器
 * 
 *
 */
@Component("validateCodeFilter")
public class ValidateCodeFilter extends OncePerRequestFilter {
	
	@Autowired
	private AuthenticationFailureHandler authenticationFailureHandler;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {

		if (StringUtils.equals("/auth_login", request.getRequestURI())
				&& StringUtils.equals(request.getMethod(), "POST")) {
			try {
				validate(request);
			} catch (Exception e) {
				authenticationFailureHandler.onAuthenticationFailure(request, response, e);
			}
		}
		chain.doFilter(request, response);

	}

	public void validate(HttpServletRequest request) {
		String codeInSession = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		String codeInRequest;
		try {
			codeInRequest = ServletRequestUtils.getRequiredStringParameter(request, "captcha");
		} catch (ServletRequestBindingException e) {
			throw new ValidateCodeException("获取验证码的值失败");
		}
		if (StringUtils.isBlank(codeInRequest)) {
			throw new ValidateCodeException("验证码的值不能为空");
		}
		if (codeInSession == null) {
			throw new ValidateCodeException("验证码不存在");
		}
		if (!StringUtils.equals(codeInSession, codeInRequest)) {
			throw new ValidateCodeException("验证码不匹配");
		}
	}

}
