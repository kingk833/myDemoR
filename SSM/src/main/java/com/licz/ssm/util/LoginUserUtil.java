package com.licz.ssm.util;

import javax.servlet.http.HttpServletRequest;

import com.licz.ssm.po.SysUser;

/**
 * <dl>
 * <dt>LoginUserUtil</dt>
 * <dd>Description:��¼�û���Ϣ�İ�����</dd>
 * <dd>Copyright: Copyright (C) 2009</dd>
 * <dd>Company: ��ţ���������������޹�˾</dd>
 * <dd>CreateDate: Feb 8, 2009</dd>
 * </dl>
 * 
 * @author Fuwenbin
 */
public abstract class LoginUserUtil {
	public final static String USER_SESSION_KEY = "APP_USER_SESSION_KEY";

	public static void saveLoginUser(HttpServletRequest request,SysUser user){
		if(request == null){
			throw new RuntimeException("AcitonContextΪ�գ�");
		}
		request.getSession().setAttribute(USER_SESSION_KEY, user);
	}
	
	public static SysUser getLoginUser(HttpServletRequest request){
		if(request == null){
			throw new RuntimeException("AcitonContextΪ�գ�");
		}
		
		return (SysUser)request.getSession().getAttribute(USER_SESSION_KEY);
	}
	
	
	public static void removeLoginUser(HttpServletRequest request, String reason){
		if(request == null){
			throw new RuntimeException("AcitonContextΪ�գ�");
		}
		
		SysUser user = getLoginUser(request);
		if(user != null){
			/*IUserLogService userLogService = (IUserLogService)BeanFactoryUtil.getBean("userLogService");
			if(userLogService != null){
				userLogService.doLogoutUser(user.getUserId(), reason);
			}*/
		}
		request.getSession().removeAttribute(USER_SESSION_KEY);
	}
}
