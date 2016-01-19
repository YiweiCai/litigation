package com.test;

public class UrlTest {
	public static void main(String[] args) {
		String uri1 = "/index.htm";
		String uri2 ="/xzfy/index.htm";
		String[] attr = uri2.split("/");
		if(attr[1].contains("index")){
			System.out.println("zz");
		}else{
			System.out.println(attr[1]);
		}
	}
}
