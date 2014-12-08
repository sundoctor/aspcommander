<%
if (typeof(ResetFlag)!="boolean") Response.End();

var SmartUpload = Server.CreateObject("aspSmartUpload.SmartUpload");
SmartUpload.Upload();
var Count = SmartUpload.Save(path);
params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);
%>