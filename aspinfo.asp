<%
//////////////////////////////////////////////////////////////////////
//
// AspInfo v1.2
//
// Some usefull debug messages
//
// File    : aspinfo.asp
// Version : 1.2
// Source  : JScript
//
// Include this file only one time!
//
// Igor Salnikov aka SunDoctor, Copyright(C)
//
// Error found? Nothing is perfect...
//
//////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////
// #function Void aspInfo()
//      Information about server environment:
//          Environment variables
//          Session variables
//          Application variables
//          Cookie variables
//          Input variables POST and GET
//////////////////////////////////////////////////////////////////////
function aspInfo() {

var result = "";

if (Request.ServerVariables.Count>0) {
    // ServerVariables
    result += "<DIV ALIGN=\"center\">\n";
    result += "<H1>AspInfo - Request.ServerVariables</H1>\n";
    result += "<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"80%\" bgcolor=\"#000000\">\n";
    result += "<TR>\n";
    result += "<TD><TABLE BORDER=\"0\" CELLPADDING=\"3\" CELLSPACING=\"1\" WIDTH=\"100%\">\n";
    var e = new Enumerator(Request.serverVariables);
    for (e.moveFirst();!e.atEnd();e.moveNext()) {
        result += "<TR>\n";
        result += "<TD bgcolor=\"#C4C4FF\" width=\"25%\"><FONT FACE=\"Arial\" SIZE=\"2\"><B>"+ e.item() +"</B></FONT></TD>\n";
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + Request.serverVariables(e.item()) + "&nbsp;</FONT></TD>\n";
        result += "</TR>\n";
    }
    result += "</TABLE></TD></TR>\n";
    result += "</TABLE>\n";
    result += "</DIV>\n";
    delete e;
}

if (Session.Contents.Count>0) {
    // Session
    result += "<DIV ALIGN=\"center\">\n";
    result += "<H1>AspInfo - Session</H1>\n";
    result += "<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"80%\" bgcolor=\"#000000\">\n";
    result += "<TR>\n";
    result += "<TD><TABLE BORDER=\"0\" CELLPADDING=\"3\" CELLSPACING=\"1\" WIDTH=\"100%\">\n";
    var e = new Enumerator(Session.Contents);
    for(e.moveFirst();!e.atEnd();e.moveNext()) {
        result += "<TR>\n";
        result += "<TD bgcolor=\"#C4C4FF\" width=\"25%\"><FONT FACE=\"Arial\" SIZE=\"2\"><B>"+ e.item() +"</B></FONT></TD>\n";
        s=""; c="";
        try {
            c = Session.Contents(e.item());
            s = typeof(Session.Contents(e.item()));
        }
        catch(e) {}
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + s + "</FONT></TD>\n";
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + c + "&nbsp;</FONT></TD>\n";
        result += "</TR>\n";
    }
    result += "</TABLE></TD></TR>\n";
    result += "</TABLE>\n";
    result += "</DIV>\n";
    delete e;
}

if (Application.Contents.Count>0) {
    // Application
    result += "<DIV ALIGN=\"center\">\n";
    result += "<H1>AspInfo - Application</H1>\n";
    result += "<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"80%\" bgcolor=\"#000000\">\n";
    result += "<TR>\n";
    result += "<TD><TABLE BORDER=\"0\" CELLPADDING=\"3\" CELLSPACING=\"1\" WIDTH=\"100%\">\n";
    var e = new Enumerator(Application.Contents);
    for(e.moveFirst();!e.atEnd();e.moveNext()) {
        result += "<TR>\n";
        result += "<TD bgcolor=\"#C4C4FF\" width=\"25%\"><FONT FACE=\"Arial\" SIZE=\"2\"><B>"+ e.item() +"</B></FONT></TD>\n";
        s = typeof(Application.Contents(e.item()));
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + s + "</FONT></TD>\n";
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + Application.Contents(e.item()) + "&nbsp;</FONT></TD>\n";
        result += "</TR>\n";
    }
    result += "</TABLE></TD></TR>\n";
    result += "</TABLE>\n";
    result += "</DIV>\n";
    delete e;
}

if (Request.Cookies.Count>0) {
    // Request.Cookies
    result += "<DIV ALIGN=\"center\">\n";
    result += "<H1>AspInfo - Request.Cookies</H1>\n";
    result += "<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"80%\" bgcolor=\"#000000\">\n";
    result += "<TR>\n";
    result += "<TD><TABLE BORDER=\"0\" CELLPADDING=\"3\" CELLSPACING=\"1\" WIDTH=\"100%\">\n";
    var e = new Enumerator(Request.Cookies);
    for(e.moveFirst();!e.atEnd();e.moveNext()) {
        result += "<TR>\n";
        result += "<TD bgcolor=\"#C4C4FF\" width=\"25%\"><FONT FACE=\"Arial\" SIZE=\"2\"><B>"+ e.item() +"</B></FONT></TD>\n";
        s = typeof(Request.Cookies(e.item()));
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + s + "</FONT></TD>\n";
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + Request.Cookies(e.item()) + "&nbsp;</FONT></TD>\n";
        result += "</TR>\n";
    }
    result += "</TABLE></TD></TR>\n";
    result += "</TABLE>\n";
    result += "</DIV>\n";
    delete e;
}


if (Request.QueryString.Count>0) {
    // Request.QueryString
    result += "<DIV ALIGN=\"center\">\n";
    result += "<H1>AspInfo - Request.QueryString</H1>\n";
    result += "<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"80%\" bgcolor=\"#000000\">\n";
    result += "<TR>\n";
    result += "<TD><TABLE BORDER=\"0\" CELLPADDING=\"3\" CELLSPACING=\"1\" WIDTH=\"100%\">\n";
    var e = new Enumerator(Request.QueryString);
    for(e.moveFirst();!e.atEnd();e.moveNext()) {
        result += "<TR>\n";
        result += "<TD bgcolor=\"#C4C4FF\" width=\"25%\"><FONT FACE=\"Arial\" SIZE=\"2\"><B>"+ e.item() +"</B></FONT></TD>\n";
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + Request.QueryString(e.item()) + "&nbsp;</FONT></TD>\n";
        result += "</TR>\n";
    }
    result += "</TABLE></TD></TR>\n";
    result += "</TABLE>\n";
    result += "</DIV>\n";
}

if (Request.Form.Count>0) {
    // Request.Form
    result += "<DIV ALIGN=\"center\">\n";
    result += "<H1>AspInfo - Request.Form</H1>\n";
    result += "<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"80%\" bgcolor=\"#000000\">\n";
    result += "<TR>\n";
    result += "<TD><TABLE BORDER=\"0\" CELLPADDING=\"3\" CELLSPACING=\"1\" WIDTH=\"100%\">\n";
    var e = new Enumerator(Request.Form);
    for(e.moveFirst();!e.atEnd();e.moveNext()) {
        result += "<TR>\n";
        result += "<TD bgcolor=\"#C4C4FF\" width=\"25%\"><FONT FACE=\"Arial\" SIZE=\"2\"><B>"+ e.item() +"</B></FONT></TD>\n";
        result += "<TD bgcolor=\"#D6D6D6\"><FONT FACE=\"Arial\" SIZE=\"2\">" + Request.Form(e.item()) + "&nbsp;</FONT></TD>\n";
        result += "</TR>\n";
    }
    result += "</TABLE></TD></TR>\n";
    result += "</TABLE>\n";
    result += "</DIV>\n";
    delete e;
}

return result;
} // function aspInfo()

%>