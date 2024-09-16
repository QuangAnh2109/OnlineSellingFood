package controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.FormatStyle;

public class Validate {
    //check string not null
    public String checkString(String str) throws Exception {
        if(str.isEmpty()) throw new Exception("String is empty");
        return str;
    }

    //check minLen <= string length value <= maxLen (minLen >= 1)
    public String checkString(String str, int minLen, int maxLen) throws Exception {
        if(str.length()>maxLen) throw new Exception("String too long");
        if(minLen > 1 && str.length()<minLen) throw new Exception("String too short");
        return str;
    }

    //check String is int number
    public int checkInt(String str) throws NumberFormatException{
        return Integer.parseInt(str);
    }

    //check min <= number <= max
    public int checkInt(int number, int min, int max) throws Exception {
        if(number<min) throw new Exception("number too small");
        if(number>max) throw new Exception("number too big");
        return number;
    }

    //check String follow format "yyyy-MM-dd HH:mm:ss"
    public LocalDateTime checkDateTime(String str) throws Exception {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime datetime = LocalDateTime.parse(str, formatter);
        if(datetime.format(formatter).equals(str)) return datetime;
        else throw new Exception("String not follow format \"yyyy-MM-dd HH:mm:ss\"");
    }
}
