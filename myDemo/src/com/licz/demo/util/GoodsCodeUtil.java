package com.licz.demo.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GoodsCodeUtil {
	
	public static String generateGoodsCodeStr(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String strTime = sdf.format(new Date());
		int iRandom = (int)(Math.random()*9000+1000);
		return strTime + iRandom;
	}
}
