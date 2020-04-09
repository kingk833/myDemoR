package com.licz.ssm.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.BindException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.licz.ssm.po.User;
import com.licz.ssm.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private IUserService userService;

	@RequestMapping("/findUserList")
	@ResponseBody
	public List<User> findUserList() throws Exception {
		List<User> users = userService.findUser();
		return users;
	}
	
	@RequestMapping("/findUser")
	@ResponseBody
	public User findUser() throws Exception {
		User user = userService.findUserId(1);
		return user;
	}
	
	@RequestMapping(value = "/admin/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> onSubmit(HttpServletRequest request,
            HttpServletResponse response, BindException errors)
            throws Exception
    {

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");

        String name = multipartRequest.getParameter("name");
        System.out.println("name: " + name);
        String realFileName = file.getOriginalFilename();
        System.out.println("??????????" + realFileName);
        String ctxPath = "E:/channelsoft/channelsoft_my/SpringForAnnotation/WebContent/files/";
                
/*        String ctxPath = request.getSession().getServletContext()
                .getRealPath("/")
                + "images/";*/
        System.out.println("??????" + ctxPath);
        File dirPath = new File(ctxPath);
        if (!dirPath.exists())
        {
            dirPath.mkdir();
        }
        File uploadFile = new File(ctxPath + realFileName);
        FileCopyUtils.copy(file.getBytes(), uploadFile);
        request.setAttribute("files", loadFiles(request));
        Map<String,String> result = new HashMap<String,String>(); 
        result.put("returnCode", "00");
        result.put("returnMsg", "成功");
        return result;
    }
	public List<String> loadFiles(HttpServletRequest request)
    {
        List<String> files = new ArrayList<String>();
        String ctxPath = "D:/channelsoft2/SpringForAnnotation/WebContent/files/";
        File file = new File(ctxPath);
        if (file.exists())
        {
            File[] fs = file.listFiles();
            String fname = null;
            for (File f : fs)
            {
                fname = f.getName();
                if (f.isFile())
                {
                    files.add(fname);
                }
            }
        }
        return files;
    }
	/*
	@RequestMapping(value = "/admin/uploadify", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> uploadify(HttpServletRequest request,HttpServletResponse response, BindException errors) throws Exception
    {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("upload");
        Photo photo = new Photo();
        photo.setId(2);
        photo.setName(file.getOriginalFilename());
        photo.setPhoto(file.getBytes());
        photoMapper.insert(photo);
        
        Map<String,String> result = new HashMap<String,String>(); 
        result.put("returnCode", "00");
        result.put("returnMsg", "??????");
        return result;
    }
	@RequestMapping("/findPhotoById")
	@ResponseBody
	public Map<String,String> findPhotoById() throws Exception {
		Photo photo = photoMapper.selectByPrimaryKey(1);
		String ctxPath = "E:/channelsoft/channelsoft_my/SpringForAnnotation/WebContent/files/";

		Map<String,String> result = new HashMap<String,String>(); 
        result.put("returnCode", "00");
        result.put("returnMsg", "成功");
        result.put("data", "Imagee/QQ.jpg");
        return result;
	}*/
	
	private byte[] inputStreamToByte(InputStream is) throws IOException {
		ByteArrayOutputStream bAOutputStream = new ByteArrayOutputStream();
		int ch;
		while ((ch = is.read()) != -1) {
			bAOutputStream.write(ch);
		}
		byte data[] = bAOutputStream.toByteArray();
		bAOutputStream.close();
		return data;
	}
	@RequestMapping("/gotoWebSocketTest")
	public String gotoWebSocketTest(){
		return "/websocket";
		
	}
	public IUserService getUserService() {
		return userService;
	}
	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
}
