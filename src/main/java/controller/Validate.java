package controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Validate {
    //check string not null
    public static void checkString(String str) throws Exception {
        if(str==null) throw new Exception("String is empty");
    }

    //check minLen <= string length value <= maxLen (minLen >= 1)
    public static void checkString(String str, int minLen, int maxLen) throws Exception {
        checkString(str);
        if(str.length()>maxLen) throw new Exception("String too long");
        if(str.length()<minLen) throw new Exception("String too short");
    }

    //check min <= number <= max
    public static void checkInt(int number, int min, int max) throws Exception {
        if(number<min) throw new Exception("number too small");
        if(number>max) throw new Exception("number too big");
    }

    //check String follow format "yyyy-MM-dd HH:mm:ss"
    public static LocalDateTime checkDateTime(String str) throws Exception {
        checkString(str);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        LocalDateTime datetime = LocalDateTime.parse(str, formatter);
        if(!datetime.format(formatter).equals(str)) throw new Exception("String not follow format \"yyyy-MM-dd HH:mm:ss.SSS\"");
        return datetime;
    }
}