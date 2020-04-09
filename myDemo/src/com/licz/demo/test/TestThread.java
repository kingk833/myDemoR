package com.licz.demo.test;

public class TestThread implements Runnable {
	
	private int total;
	
	public TestThread(int total){
		this.total = total;
	}

	@Override
	public void run() {
		for(int i=0;i<total;i++){
			System.out.println("sub"+i);
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	

}
