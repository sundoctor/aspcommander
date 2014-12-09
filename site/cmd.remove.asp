<!--#include file="urldecode.asp"-->
<%
if (typeof(ResetFlag)!="boolean") Response.End();

var fn = "";
var fso = new ActiveXObject("Scripting.FileSystemObject");

for(var i=1; i<=Request.Form("file[]").Count; i++) {
    fn = "" + Request.Form("file[]")(i);
    fn = URLDecode(fn);
    var dirFlag = (fn.substr(0,1)=="D");
    var filename = fn.substr(1,fn.length-1);
    var fullname = path + "\\" + filename;
    if (dirFlag) {
        fso.DeleteFolder(fullname, true);
    } else {
        fso.DeleteFile(fullname, true);
    }
}

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);

%>