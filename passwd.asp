<%@ LANGUAGE=JScript %>
<!--#include file="md5.asp"-->
<%
var key = "";
var value = "";
if (Request.QueryString.Key("key")!="") {
    key = "" + Request.QueryString("key");
    value = key.md5();
}
%>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#848484">
<TR>
<TD><TABLE BORDER="0" CELLSPACING="1" CELLPADDING="2">
<FORM ACTION="passwd.asp">
<TR BGCOLOR="#B8B8B8">
	<TD>Password:</TD>
	<TD><INPUT TYPE="text" SIZE=36 NAME="key" VALUE="<%=key%>"></TD>
<TR BGCOLOR="#CCCCCC">
	<TD>MD5:</TD>
	<TD><INPUT TYPE="text" SIZE=36 NAME="value" VALUE="<%=value%>" READONLY></TD>
</TR>
<TR BGCOLOR="#CCCCCC" ALIGN="center">
    <TD COLSPAN="2"><INPUT TYPE="submit" VALUE="Make MD5"></TD>
</TR>
</FORM>
</TABLE></TD>
</TR>
</TABLE>

