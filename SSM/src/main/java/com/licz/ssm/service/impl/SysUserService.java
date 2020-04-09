package com.licz.ssm.service.impl;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.licz.ssm.mapper.SysUserMapper;
import com.licz.ssm.po.SysUser;
import com.licz.ssm.po.SysUserExample;
import com.licz.ssm.po.SysUserExample.Criteria;
import com.licz.ssm.service.ISysUserService;
@Service
public class SysUserService implements ISysUserService {
	
	private SysUserMapper sysUserMapper;

	@Override
	public SysUser findByUserName(String userName) throws Exception {
		SysUser sysUser = null;
		SysUserExample example = new SysUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(userName);
		List<SysUser> sysUserList = sysUserMapper.selectByExample(example);
		if(CollectionUtils.isNotEmpty(sysUserList)){
			sysUser = sysUserList.get(0);
		}
		return sysUser;
	}

	public SysUserMapper getSysUserMapper() {
		return sysUserMapper;
	}
	@Autowired
	public void setSysUserMapper(SysUserMapper sysUserMapper) {
		this.sysUserMapper = sysUserMapper;
	}


}
