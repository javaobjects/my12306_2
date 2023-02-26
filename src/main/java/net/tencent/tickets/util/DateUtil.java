package net.tencent.tickets.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类：
		String -> java.util.Date
		java.util.Date -> String
		
		String -> Calendar
		Calendar -> String
		
		java.sql.Date -> java.util.Date<自动转换>
		java.util.Date -> java.sql.Date<略>
 */
public class DateUtil {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * String -> java.util.Date
	 * 
	 * @param source 字符串格式的日期
	 * @return  java.util.Date
	 */
	public static Date stringToUtilDate(String source)
	{
		try {
			return sdf.parse(source);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * java.util.Date -> String
	 * 
	 * @param date 日期
	 * @return 格式化之后的日期字符串
	 */
	public static String utilDateToString(Date date)
	{
		return sdf.format(date);
	}
	
	/**
	 * String -> Calendar : 
	 *  		实际转换路径 String -> Date -> Calendar
	 *  
	 * @param source 字符串格式的日期
	 * @return Calendar日历
	 */
	public static Calendar stringToCalendar(String source)
	{
		try {
			//字符串  -> Date
			Date date = sdf.parse(source);
			
			//Date -> Calendar
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			
			return calendar;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Calendar -> String : 
	 * 			实际转换路径  Calendar -> Date -> String
	 * 
	 * @param calendar 日历类
	 * @return 格式化后的日期字符串
	 */
	public static String calendarToString(Calendar calendar)
	{
		//Calendar -> Date
		Date date = calendar.getTime();
		
		//Date -> String
		return sdf.format(date);
	}
}
