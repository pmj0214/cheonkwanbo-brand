package kr.co.echomarketing.cheonkwanbobrand.utils;

import kr.co.echomarketing.cheonkwanbobrand.enums.DateFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class DateUtils {

    private static DateTimeFormatter dateTimeFormatter;

    public static boolean isDuplicate(String regDate, long expireDay) {
        long days = dateBetween(regDate);
        return days <= expireDay;
    }

    public static boolean isTowMonthDuplicate(String expireDate) {
        long days = dateBetween(expireDate);
        return days >= 0;
    }

    public static String nowDateTime() {
        return nowDateTime(DateFormat.YYYYMMDDHHMMSS.find());
    }

    public static String nowDate() {
        return nowDateTime(DateFormat.YYYYMMDD.find());
    }

    public static String yesterdayDate(String dt) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DateFormat.YYYYMMDD.find());
        LocalDate inputdate = LocalDate.parse(dt, formatter);
        LocalDate ysesterDay = inputdate.minusDays(1);
        return ysesterDay.format(formatter);
    }

    private static long dateBetween(String dbDate) {
        LocalDateTime convertExpireDate = stringToDateTime(dbDate);
        LocalDateTime currentDate = LocalDateTime.now();
        return ChronoUnit.DAYS.between(convertExpireDate, currentDate);
    }

    private static LocalDateTime stringToDateTime(String expireDate) {
        dateTimeFormatter = DateTimeFormatter.ofPattern(DateFormat.YYYY_MM_DD_HH_MM_SS.find());
        return LocalDateTime.parse(expireDate, dateTimeFormatter);
    }

    private static String nowDateTime(String format) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(format);
        LocalDateTime currentDate = LocalDateTime.now();
        return currentDate.format(dateTimeFormatter);
    }

}
