package com.licz.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.licz.ssm.po.SysUser;
import com.licz.ssm.service.ISysUserService;
import com.licz.ssm.util.LoginUserUtil;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private ISysUserService sysUserService;

	@RequestMapping("/login")
	public String login(HttpServletRequest request) throws Exception {
		String gotoUrl = null;
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		SysUser sysUser = sysUserService.findByUserName(userName);
		if(null == sysUser || !StringUtils.equals(password, sysUser.getPassword())){
			gotoUrl = "login";
		}else{
			LoginUserUtil.saveLoginUser(request, sysUser);
			gotoUrl = "admin/main";
		}
		return gotoUrl;
	}
	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest request) throws Exception {
		String gotoUrl = "login";
		LoginUserUtil.removeLoginUser(request, "ÍË³ö");
		return gotoUrl;
	}
	
	
	
	
	@RequestMapping("/test")
	@ResponseBody
	public Map<String,Object> test(HttpServletRequest request){
		Map<String,Object> re = new HashMap<String,Object>();
		SysUser user2 = LoginUserUtil.getLoginUser(request);
		re.put("data", user2);
		return re;
	}
}
