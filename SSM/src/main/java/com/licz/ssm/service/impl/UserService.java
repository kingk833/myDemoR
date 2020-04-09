package com.licz.ssm.service.impl;

import java.util.List;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.licz.ssm.mapper.UserMapper;
import com.licz.ssm.po.User;
import com.licz.ssm.po.UserExample;
import com.licz.ssm.service.IUserService;
@Service
@WebService(serviceName = "useService", endpointInterface = "com.licz.ssm.service.IUserService") 
public class UserService implements IUserService {
	
	private UserMapper userMapper;

	public List<User> findUser() throws Exception {
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(2);
		List<User> users = userMapper.selectByExample(example);
		return users;
	}
	
	public User findUserId(Integer id) throws Exception {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}
	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	

}
