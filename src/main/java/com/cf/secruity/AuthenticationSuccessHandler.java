package com.cf.secruity;

import com.alibaba.fastjson.JSON;
import com.cf.utils.R;
import com.cf.utils.RequestUtils;
import com.cf.utils.ResponseUtils;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by yangrd on 2017/7/4.
 */
@Component
public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private static final String LOGIN_SUCCESS_RESULT = JSON.toJSONString(R.ok("登录成功"));

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        if (RequestUtils.isAjax(request)) {
            ResponseUtils.print(response, LOGIN_SUCCESS_RESULT);
        } else {
            super.onAuthenticationSuccess(request, response, auth);
        }
    }

}
