package com.licz.demo.util;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		while (scanner.hasNextLine()) {
			String src = scanner.nextLine();
			if(src.length() > 100){
				return;
			}
			String[] strArrTemp = src.split(",");
			for (int i = 0; i < strArrTemp.length - 1; i++) {//冒泡算法
				for (int j = 0; j < strArrTemp.length - i - 1; j++) {
					String temp_j = strArrTemp[j].substring(strArrTemp[j].length() - 1);// 获取j位最后一位字符
					String temp_j1 = strArrTemp[j + 1].substring(strArrTemp[j + 1].length() - 1);// 获取j+1位最后一位字符
					if(temp_j.charAt(0) < temp_j1.charAt(0)){
						String item = "";
						item = strArrTemp[j];
						strArrTemp[j] = strArrTemp[j + 1];
						strArrTemp[j + 1] = item;
					}
				}
			}
			String out = "";
			for (int i = 0; i < strArrTemp.length; i++) {
				out = out + strArrTemp[i] + ",";
			}
			if(out.endsWith(",")){
				out = out.substring(0, out.length() -1);
			}
			System.out.println(out);
		}
		scanner.close();
	}
}
