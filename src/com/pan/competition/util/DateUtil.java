package com.pan.competition.util;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil {
	public static Date stringToDate(String str){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = new Date(dateFormat.parse(str).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
	}
	
	public static Timestamp stringToTimestamp(String str) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());  
        try { 
        	str = str+":00";
            ts = Timestamp.valueOf(str);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		return ts;
	}
}
