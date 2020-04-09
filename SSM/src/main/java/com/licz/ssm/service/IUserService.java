package com.licz.ssm.service;

import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.licz.ssm.po.User;
@WebService
public interface IUserService {
	List<User> findUser() throws Exception;
	
	@WebMethod
	User findUserId(Integer id) throws Exception;
}
