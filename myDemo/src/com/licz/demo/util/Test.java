package com.licz.demo.util;

public class Test {

	public static void main(String[] args) {
		int[] intArr = {1,8,3,6,5,7,2,9};
		for (int i = 0; i < intArr.length - 1; i++) {
			for (int j = 0; j < intArr.length - i - 1; j++) {
				/*==0,<-1,>2  A1,B2,d0,a9,C3*/
				if(intArr[j] >  intArr[j+1]){
					int item = 0;
					item = intArr[j];
					intArr[j] = intArr[j + 1];
					intArr[j + 1] = item;
				}
			}
		}
		for (int i = 0; i < intArr.length; i++) {
			System.out.println(intArr[i]);
		}
	}

}
