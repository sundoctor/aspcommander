<%
//////////////////////////////////////////////////////////////////////
//
// Time v1.2
//
// Date-time functions
//
// File    : time.asp
// Version : 1.2
// Source  : JScript
//
// Windows 2000 Professional
// Windows 2000 Advanced Server
// Internet Information Server
//
// Include this file only one time!
//
// Igor Salnikov aka SunDoctor, Copyright(C)
//
// Error found? Nothing is perfect...
//
//////////////////////////////////////////////////////////////////////

// 0123456789012345678
// YYYY-MM-DD HH-MM-SS

//////////////////////////////////////////////////////////////////////
// #var Hash _MONTHS
//      Hash with months {1..12 => 'January'..'December'}
//////////////////////////////////////////////////////////////////////
var _MONTHS = {
    '1': 'January',
    '2': 'February',
    '3': 'March',
    '4': 'April',
    '5': 'May',
    '6': 'June',
    '7': 'July',
    '8': 'August',
    '9': 'September',
    '10': 'October',
    '11': 'November',
    '12': 'December'
};

//////////////////////////////////////////////////////////////////////
// #var Hash _DAYS
//      Hash with weekdays {0..6 => 'Sunday'..'Saturday'}
//////////////////////////////////////////////////////////////////////
var _DAYS = {
    '0' : 'Sunday',
    '1' : 'Monday',
    '2' : 'Tuesday',
    '3' : 'Wednesday',
    '4' : 'Thursday',
    '5' : 'Friday',
    '6' : 'Saturday'
};

//////////////////////////////////////////////////////////////////////
// #var Hash _SMONTHS
//      Hash with short months {1..12 => 'Jan'..'Dec'}
//////////////////////////////////////////////////////////////////////
var _SMONTHS = {
    '1': 'Jan',
    '2': 'Feb',
    '3': 'Mar',
    '4': 'Apr',
    '5': 'May',
    '6': 'Jun',
    '7': 'Jul',
    '8': 'Aug',
    '9': 'Sep',
    '10': 'Oct',
    '11': 'Nov',
    '12': 'Dec'
};

//////////////////////////////////////////////////////////////////////
// #var Hash _SDAYS
//      Hash with short weekdays {0..6 => 'Sun'..'Sat'}
//////////////////////////////////////////////////////////////////////
var _SDAYS = {
    '0' : 'Sun',
    '1' : 'Mon',
    '2' : 'Tue',
    '3' : 'Wed',
    '4' : 'Thu',
    '5' : 'Fri',
    '6' : 'Sat'
};

//////////////////////////////////////////////////////////////////////
// #var Hash _RUMONTHS
//      Hash with russian months {1..12 => 'Январь'..'Декабрь'}
//////////////////////////////////////////////////////////////////////
var _RUMONTHS = {
    '1': 'Январь',
    '2': 'Февраль',
    '3': 'Март',
    '4': 'Апрель',
    '5': 'Май',
    '6': 'Июнь',
    '7': 'Июль',
    '8': 'Август',
    '9': 'Сентябрь',
    '10': 'Октябрь',
    '11': 'Ноябрь',
    '12': 'Декабрь'
};

//////////////////////////////////////////////////////////////////////
// #var Hash _RUDAYS
//      Hash with russian weekdays {0..6 => 'Воскресенье'..'Суббота'}
//////////////////////////////////////////////////////////////////////
var _RUDAYS = {
    '0' : 'Воскресенье',
    '1' : 'Понедельник',
    '2' : 'Вторник',
    '3' : 'Среда',
    '4' : 'Четверг',
    '5' : 'Пятница',
    '6' : 'Суббота'
};

//////////////////////////////////////////////////////////////////////
// #var Hash _RUSDAYS
//      Hash with short russian weekdays {0..6 => 'Вс'..'Сб'}
//////////////////////////////////////////////////////////////////////
var _RUSDAYS = {
    '0' : 'Вс',
    '1' : 'Пн',
    '2' : 'Вт',
    '3' : 'Ср',
    '4' : 'Чт',
    '5' : 'Пт',
    '6' : 'Сб'
};

//////////////////////////////////////////////////////////////////////
// #function String IsoDate([String UTCdate])
//      Get date in ISO-format: yyyy-mm-dd
// #param String UTCdate
//      Date in UTC-format
// #return String
//      Date in ISO-format
//////////////////////////////////////////////////////////////////////
function IsoDate(v) {
    var d;
    if (v!=null) d = new Date(v);
    else d = new Date();
    var day = d.getDate();
    var month = (d.getMonth() + 1);
    var year = d.getFullYear();
    if (month<10) month = "0" + month;
    if (day<10) day = "0" + day;
    return (""+year+"-"+month+"-"+day);
}

//////////////////////////////////////////////////////////////////////
// #function String IsoTime([String UTCdate])
//      Get time in ISO-format: hh:mm:ss
// #param String UTCdate
//      DateTime in UTC-format
// #return String
//      Time in ISO-format
//////////////////////////////////////////////////////////////////////
function IsoTime(v) {
    var d;
    if (v!=null) d = new Date(v);
    else d = new Date();
    var hours = d.getHours();
    var minutes = d.getMinutes();
    var seconds = d.getSeconds();
    if (hours<10) hours = "0" + hours;
    if (minutes<10) minutes = "0" + minutes;
    if (seconds<10) seconds = "0" + seconds;
    return (""+hours+":"+minutes+":"+seconds);
}

//////////////////////////////////////////////////////////////////////
// #function String IsoDateTime([String UTCdate])
//      Get date and time in ISO-format: yyyy-dd-mm hh:mm:ss
// #param String UTCdate
//      DateTime in UTC-format
// #return String
//      DateTime in ISO-format
//////////////////////////////////////////////////////////////////////
function IsoDateTime(v) {
    return (IsoDate(v)+" "+IsoTime(v));
}

//////////////////////////////////////////////////////////////////////
// #function Hash getDate([String initDate])
//      Get hash-array with different datetime tokens
// #param String initDate
//      ISO date, ISO datetime or UTC date
// #return Hash
//      Hash with fixed keys
//////////////////////////////////////////////////////////////////////
function getDate(v) {
    var d;
    if (v!=null) {
        // ISO-date
        if (typeof(v)=="string" && v.length==10)
            d = new Date(v.substr(0,4),v.substr(5,2)-1,v.substr(8,2));
        // ISO-datetime
        else if (typeof(v)=="string" && v.length==19)
            d = new Date(v.substr(0,4),v.substr(5,2)-1,v.substr(8,2),
                         v.substr(11,2),v.substr(14,2),v.substr(17,2));
        else
            d = new Date(v);
    }
    else d = new Date();
    var day = d.getDay();
    var day_d = d.getDate();
    var month_m = (d.getMonth() + 1);
    var year_yyyy = d.getFullYear();
    var year_yy = String(year_yyyy).substr(2,2);

    var month_mm = month_m;
    if (month_mm<10) month_mm = "0" + month_mm;
    var day_dd = day_d;
    if (day_dd<10) day_dd = "0" + day_dd;

    var hours_h = d.getHours();
    var minutes_m = d.getMinutes();
    var seconds_s = d.getSeconds();
    var hours_hh = hours_h;
    var minutes_mm = minutes_m;
    var seconds_ss = seconds_s
    if (hours_hh<10) hours_hh = "0" + hours_hh;
    if (minutes_mm<10) minutes_mm = "0" + minutes_mm;
    if (seconds_ss<10) seconds_ss = "0" + seconds_ss;

    var result = {
        "d":day_d,
        "dd":day_dd,
        "m":month_m,
        "mm":month_mm,
        "yy":year_yy,
        "yyyy":year_yyyy,
        "dno":day,
        "dnm":_DAYS[day],
        "mnm":_MONTHS[month_m],
        "sdnm":_SDAYS[day],
        "smnm":_SMONTHS[month_m],
        "h":hours_h,
        "hh":hours_hh,
        "i":minutes_m,
        "ii":minutes_mm,
        "s":seconds_s,
        "ss":seconds_ss
    };
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function String getFormatDate(Array format, String date)
//      Get formatted datetime 
// #param Array format
//      Array with keys from fixed array
// #param String date
//      Date to format
// #example
//      getFormatDate(["dnm"," ","dd",".","mm",".","yyyy"],"2002-11-27")
//////////////////////////////////////////////////////////////////////
function getFormatDate(format,v) {
    var d = getDate(v);
    var result = "";
    for(var i=0;i<format.length;i++) {
        if (d[format[i]]!=null)
            result+=d[format[i]];
        else
            result+=format[i];
    }
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Integer microtime()
//      Get milliseconds from 1.01.1970
// #return Integer
//      Milliseconds
//////////////////////////////////////////////////////////////////////
function microtime() {
    var d = new Date();
    return Date.UTC(d.getFullYear(), d.getMonth(), d.getDay(),
                    d.getHours(), d.getMinutes(), d.getSeconds(),
                    d.getMilliseconds());
}

//////////////////////////////////////////////////////////////////////
// #function Integer everyDayNumber()
//      Get "day number" in form of '20141127'
// #return Integer
//      Integer digit
//////////////////////////////////////////////////////////////////////
function everyDayNumber() {
    var timestamp = microtime();
    var result = Math.round(timestamp/1000/60/60/24);
    return result;
}

%>