package com.learn.mycart.helper;

import java.util.List;
import java.util.concurrent.TimeUnit;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;

public class Test {

	/**
	 * Convert a millisecond duration to a string format
	 * 
	 * @param millis A duration to convert to a string form
	 * @return A string of the form "X Days Y Hours Z Minutes A Seconds".
	 */
	public static String getDurationBreakdown(long millis) {
		if (millis < 0) {
			throw new IllegalArgumentException("Duration must be greater than zero!");
		}

		long days = TimeUnit.MILLISECONDS.toDays(millis);
		millis -= TimeUnit.DAYS.toMillis(days);
		long hours = TimeUnit.MILLISECONDS.toHours(millis);
		millis -= TimeUnit.HOURS.toMillis(hours);
		long minutes = TimeUnit.MILLISECONDS.toMinutes(millis);
		millis -= TimeUnit.MINUTES.toMillis(minutes);
		long seconds = TimeUnit.MILLISECONDS.toSeconds(millis);

		StringBuilder sb = new StringBuilder(64);
		sb.append(days);
		sb.append(" Days ");
		sb.append(hours);
		sb.append(" Hours ");
		sb.append(minutes);
		sb.append(" Minutes ");
		sb.append(seconds);
		sb.append(" Seconds");

		return (sb.toString());
	}
	
	
	public static void main(String[] args) {
	
		UserDao ud = new UserDao(FactoryProvider.getFactory());
	       List<User> users =ud.getAllUsers();
	       System.out.println(users.size());
		
		
		
	}

}
