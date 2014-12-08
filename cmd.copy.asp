<!--#include file="urldecode.asp"-->
<%
if (typeof(ResetFlag)!="boolean") Response.End();

Session("bufAction")  = "copy";
Session("bufSrcPath") = path;

var a = [];
for(var i=1; i<=Request.Form("file[]").Count; i++) {
    fn = "" + Request.Form("file[]")(i);
    a[a.length] = ""+URLDecode(fn);
}

Session("bufFiles") = a.join("*");

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);

%>