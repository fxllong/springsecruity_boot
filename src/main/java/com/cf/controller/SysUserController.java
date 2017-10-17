package com.cf.controller;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.*;

import com.cf.entity.SysUserEntity;
import com.cf.service.SysUserRoleService;
import com.cf.service.SysUserService;
import com.cf.utils.*;
import com.cf.utils.annotation.SysLog;
import com.cf.utils.validator.Assert;
import com.cf.utils.validator.ValidatorUtils;
import com.cf.utils.validator.group.AddGroup;
import com.cf.utils.validator.group.UpdateGroup;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 系统用户
 * 
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController  {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//只有超级管理员，才能查看所有管理员列表
		if(getCurrentUser().getUserId() != Constant.SUPER_ADMIN){
			params.put("createUserId", getCurrentUser().getUserId());
		}
		//查询列表数据
		Query query = new Query(params);
		List<SysUserEntity> userList = sysUserService.queryList(query);
		int total = sysUserService.queryTotal(query);
		PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}
	
	public UserDetails getUser() {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
			    .getAuthentication()
			    .getPrincipal();
		return userDetails;
	}
	
	public SysUserEntity getCurrentUser() {
		return sysUserService.queryByUserName(getUser().getUsername());
	}
	

	/**
	 * 获取登录的用户信息
	 */
	@RequestMapping("/info")
	public R info(){
		return R.ok().put("user", getUser());
	}
	
	/**
	 * 修改登录用户密码
	 */
	@SysLog("修改密码")
	@RequestMapping("/password")
	public R password(String password, String newPassword,HttpServletRequest request, HttpServletResponse response){
		Assert.isBlank(newPassword, "新密码不为能空");
		//sha256加密
		password = passwordEncoder.encode(password);
		//sha256加密
		newPassword = passwordEncoder.encode(newPassword);
		//更新密码
		int count = sysUserService.updatePassword(getCurrentUser().getUserId(), password, newPassword);
		if(count == 0){
			return R.error("原密码不正确");
		}
		//清空SESSION
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		return R.ok();
	}
	
	/**
	 * 用户信息
	 */
	@RequestMapping("/info/{userId}")
	public R info(@PathVariable("userId") Long userId){
		SysUserEntity user = sysUserService.queryObject(userId);
		//获取用户所属的角色列表
		List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
		user.setRoleIdList(roleIdList);
		return R.ok().put("user", user);
	}
	
	/**
	 * 保存用户
	 */
	@SysLog("保存用户")
	@RequestMapping("/save")
	public R save(@RequestBody SysUserEntity user){
		System.out.println("添加的用户信息为："+ user.toString());
		ValidatorUtils.validateEntity(user, AddGroup.class);
		//user.setCreateUserId(getUserId());
		sysUserService.save(user);
		return R.ok();
	}
	
	/**
	 * 修改用户
	 */
	@SysLog("修改用户")
	@RequestMapping("/update")
	public R update(@RequestBody SysUserEntity user){
		ValidatorUtils.validateEntity(user, UpdateGroup.class);
		//user.setCreateUserId(getUserId());
		sysUserService.update(user);
		return R.ok();
	}
	
	/**
	 * 删除用户
	 */
	@SysLog("删除用户")
	@RequestMapping("/delete")
	public R delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return R.error("系统管理员不能删除");
		}
		if(ArrayUtils.contains(userIds, getCurrentUser().getUserId())){
			return R.error("当前用户不能删除");
		}
		sysUserService.deleteBatch(userIds);
		return R.ok();
	}
}
