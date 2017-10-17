package com.cf.secruity;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.cf.entity.SysUserEntity;
import com.cf.service.SysUserService;

/**
 * 封装用户信息逻辑 Spring secruity 会拿这个对象进行处理
 */
@Component("myUserDetailService")
public class CustomUserDetailsService implements UserDetailsService {

	// private static final Logger logger =
	// LoggerFactory.getLogger(CustomUserDetailsService.class);

	@Autowired
	private SysUserService userService;
	// @Resource
	// private RedisCacheUtil RedisCacheUtil;

	@Override
	public UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException {
		// 根据用户名查找用户信息
		SysUserEntity user = userService.queryByUserName(loginName);
		if (user == null) {
			throw new UsernameNotFoundException("not found");
		}
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();

		List<String> perms = userService.queryAllPerms(user.getUserId());
		for (String perm : perms) {
			authorities.add(new SimpleGrantedAuthority(perm));
		}
		// 参数username是前台传过来的用户名
		// logger.info("数据库对应的密码为： " + password);
		return new org.springframework.security.core.userdetails.User(loginName, user.getPassword(), true, true, true,
				true, authorities);
	}

}