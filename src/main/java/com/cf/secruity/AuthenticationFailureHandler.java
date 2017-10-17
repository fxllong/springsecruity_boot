package com.cf.secruity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson.JSON;
import com.cf.utils.R;
import com.cf.utils.RequestUtils;
import com.cf.utils.ResponseUtils;
import com.cf.utils.validator.ValidateCodeException;

@Component
public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    private static final String LOGIN_ERROR_RESULT = JSON.toJSONString(R.error("登录失败,请检验密码"));

    private static final String LOGIN_FROZEN_RESULT = JSON.toJSONString(R.error("用户已被冻结"));

    private static final String LOGIN_CODE_RESULT = JSON.toJSONString(R.error("验证码错误"));
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, Exception e) throws IOException, ServletException {
        if (RequestUtils.isAjax(request)) {
            String result = e instanceof DisabledException ? LOGIN_FROZEN_RESULT : LOGIN_ERROR_RESULT;
            if(e instanceof ValidateCodeException) {
               result = LOGIN_CODE_RESULT;
            }
            ResponseUtils.print(response, result);
        } else {
            super.onAuthenticationFailure(request, response, (AuthenticationException) e);
        }
    }
}
