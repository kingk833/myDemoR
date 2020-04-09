package com.licz.demo.test;

import java.util.Scanner;

public class Main {
	public static StringBuffer getLastWorldLength(String srcStr){
		int index1 = srcStr.length() % 8;
		int bu1 = -1;
		if(index1 != 0){
			bu1 = 8 - index1;
		} 
		if(bu1 != -1){
			for (int i = 0; i < bu1; i++) {
				srcStr = srcStr + "0";
			}
		}
		return new StringBuffer(srcStr);
	}
	public static void main(String[] args) {
		/*Scanner scanner = new Scanner(System.in);
		Main t = new Main();
		while(scanner.hasNextLine()){
			String str = scanner.nextLine();
			int index = t.getLastWorldLength(str);
			System.out.println(index);
		}
		scanner.close();*/
		
		Scanner scanner = new Scanner(System.in);
		StringBuffer str1 = getLastWorldLength(scanner.nextLine());
		StringBuffer str2 = getLastWorldLength(scanner.nextLine());
		int index1 = str1.length() / 8;
		for (int i = 0; i < index1; i++) {
			String temp = str1.substring(i * 8, i * 8 + 8);
			for (int j = 0; j < 8; j++) {
				System.out.print(temp.charAt(j));
				if(j == 7){
					System.out.println();
				}
			}
		}
		
		int index2 = str2.length() / 8;
		for (int i = 0; i < index2; i++) {
			String temp = str2.substring(i * 8, i * 8 + 8);
			for (int j = 0; j < 8; j++) {
				System.out.print(temp.charAt(j));
				if(j == 7){
					System.out.println();
				}
			}
		}
		
		//Integer.pa
	}
}
