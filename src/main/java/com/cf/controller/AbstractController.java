package com.cf.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Controller公共组件
 * 
 */
public abstract class AbstractController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
//	protected SysUserEntity getUser() {
//		return ShiroUtils.getUserEntity();
//	}
//
//	protected Long getUserId() {
//		return getUser().getUserId();
//	}
}
