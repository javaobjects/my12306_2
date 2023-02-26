package net.tencent.tickets.util.test;

import net.tencent.tickets.util.Md5Utils;

public class TestMd5Utils {
	public static void main(String[] args) {
		String passWord = "123456";
		Md5Utils md5Utils = new Md5Utils();
		System.out.println(passWord + " 经md5转换后为： " + md5Utils.md5(passWord));
	}
}
