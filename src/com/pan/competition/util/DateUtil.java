package com.pan.competition.util;

import java.sql.Date;
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
}
