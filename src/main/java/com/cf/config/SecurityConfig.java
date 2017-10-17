package com.cf.config;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.cf.secruity.AuthenticationFailureHandler;
import com.cf.secruity.AuthenticationSuccessHandler;
import com.cf.secruity.MyFilterSecurityInterceptor;
import com.cf.utils.validator.ValidateCodeFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthenticationSuccessHandler authenticationSuccessHandler;

	@Autowired
	private AuthenticationFailureHandler authenticationFailureHandler;

	@Resource(name = "myUserDetailService")
	private UserDetailsService myUserDetailService;

	@Resource
	private MyFilterSecurityInterceptor myFilterSecurityInterceptor;

	@Resource
	private ValidateCodeFilter validateCodeFilter;

	@Bean
	public PasswordEncoder createPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.addFilterBefore(myFilterSecurityInterceptor, FilterSecurityInterceptor.class)// 在正确的位置添加我们自定义的过滤器
				.addFilterBefore(validateCodeFilter, UsernamePasswordAuthenticationFilter.class).formLogin()
				.loginPage("/login.html").loginProcessingUrl("/auth_login").successHandler(authenticationSuccessHandler)
				.failureHandler(authenticationFailureHandler).and().headers().frameOptions().disable()
				// .and().headers()
				// .addHeaderWriter(new
				// XFrameOptionsHeaderWriter(XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN))
				.and().authorizeRequests().antMatchers("/**/*.css", "/img/**", "/**/*.js", "/*/api/**", "/login.html",
						"/auth_login", "/captcha.jpg")
				.permitAll().anyRequest().authenticated().and().csrf().disable();

	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(myUserDetailService).passwordEncoder(createPasswordEncoder());
	}

}
