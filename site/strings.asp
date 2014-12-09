<%
//////////////////////////////////////////////////////////////////////
//
// Strings v1.2
//
// Strings functions
//
// File    : strings.asp
// Version : 1.1
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

//////////////////////////////////////////////////////////////////////
// #function String Template(String s, Hash a)
//      Replace parameters in string
// #param String s
//      String template
// #param Hash a
//      Hash with parameters
// #return String
//      String with replaced keys
//////////////////////////////////////////////////////////////////////
function Template(s, a) {
    // Подстановка параметров
    for(var key in a) {
        re = new RegExp("<!--\\$" + key + "-->","ig");
        s = s.replace(re, a[key]);
    }
    // Очистка
    re = new RegExp("<!--\\$.*?-->","ig");
    s = s.replace(re, '');
    return s;
}

///////////////////////////////////////////////////////////////////////
// Main "tag-function" to build HTML tags
///////////////////////////////////////////////////////////////////////
function Tag(a) {
    var result = "";
    var tag = typeof(a["tag"])=="undefined"?"":a["tag"];
    var inside = typeof(a["inside"])=="undefined"?"":a["inside"];
    for(k in a) {
        var test = (k=="tag") || (k=="inside") || ((""+a[k])=="");
        if (!test) {
            result += " " + k + "=\"" + a[k] + "\"";
        }
    }
    result = "<" +  tag + result + ">";
    var test = (a["tag"]=="INPUT") ||
               (a["tag"]=="IMG") ||
               (a["tag"]=="HR");
    if (!test)
        result += inside + "</" + tag + ">";
    return result;
}


//////////////////////////////////////////////////////////////////////
// Function to build standart QUERY-string
//////////////////////////////////////////////////////////////////////
function getQueryString(a) {
    var result = [];
    for(var k in a) {
        if (a[k]!=null) {
            var str = Server.URLEncode(k) +
                   "=" + Server.URLEncode(a[k]);
            result[result.length] = str;
        }
    }
    return result.join("&");
}

///////////////////////////////////////////////////////////////////////
// Function trim()
///////////////////////////////////////////////////////////////////////
function trimSpaces(str) {
    str = ""+str;
    return str.replace(/\s/g, "");
}

//////////////////////////////////////////////////////////////////////
// #function String SafeChars(String str)
//      Function to replace:
//          & : &amp;
//          < : &lt;
//          > : &gt;
//          " : &quot;
//          ' : &#039;
// #param String str
//      string
// #return String
//      modified string
//////////////////////////////////////////////////////////////////////
function SafeChars(str) {
    var re = /\&/gi;
    str = ""+str.replace(re,"&amp;");
    re = /</gi;
    str = ""+str.replace(re,"&lt;");
    re = />/gi;
    str = ""+str.replace(re,"&&gt;");
    re = /"/gi;
    str = ""+str.replace(re,"&quot;");
    re = /'/gi;
    str = ""+str.replace(re,"&#039;");
    return str;
}

//////////////////////////////////////////////////////////////////////
// #function String n2br(String str)
//      Replacing \n into <BR>
// #param String str
//      String or multiline string
// #return String
//      Modified string
//////////////////////////////////////////////////////////////////////
function n2br(str) {
    var re = /\n/ig;
    return str.replace(re,"<BR>\n");
}

//////////////////////////////////////////////////////////////////////
// Format floating point number
//////////////////////////////////////////////////////////////////////
function formatNumber(n,p) {
    var x = ""+n;
    if (x.indexOf(".")==-1) {
        x=x+".";
        for(var i=0;i<p;i++) x=x+"0";
    } else {
        var l = x.length-x.indexOf(".")-1;
        if (l>=p) x=x.substr(0,x.length-(l-p));
        else for(var i=0;i<(p-l);i++) x=x+"0";
    }
    return x;
}
%>