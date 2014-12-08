<%
if (typeof(ResetFlag)!="boolean") Response.End();

Session("bufAction")  = "";
Session("bufSrcPath") = "";
Session("bufFiles")   = "";

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);

%>