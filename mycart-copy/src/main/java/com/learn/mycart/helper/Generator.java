package com.learn.mycart.helper;

import java.util.Random;

public class Generator {
	static String capitalChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static String smallChars = "abcdefghijklmnopqrstuvwxyz";
	static String numbers = "1234567899876543210";
	static String symbols = "!@#$%&";
	public static String valueForPassword = capitalChars + smallChars + numbers + symbols;

	public static char[] getPassword() {
		char[] password = new char[8];
		Random rand = new Random();

		for (int i = 0; i < 8; i++) {

			password[i] = valueForPassword.charAt(rand.nextInt(valueForPassword.length()));

		}

		return password;
	}

	public static int getOTP() {
		Random random = new Random();
		int otp = 1000 + random.nextInt(9000);
		System.out.println(otp);
		return otp;

	}

	public static void main(String[] args) {

		System.out.println(Generator.getPassword());
		System.out.println(Generator.getOTP());

	}

}
