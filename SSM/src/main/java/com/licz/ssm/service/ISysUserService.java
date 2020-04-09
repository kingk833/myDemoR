package com.licz.ssm.service;

import com.licz.ssm.po.SysUser;
public interface ISysUserService {
	SysUser findByUserName(String userName) throws Exception;
}
