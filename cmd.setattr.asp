<!--#include file="urldecode.asp"-->
<%
var filename = Request.Form.Key("filename")!=""?
               "" + Request.Form("filename") : "";

filename = URLDecode(filename);
var dirFlag = (filename.substr(0,1)=="D");
filename = filename.substr(1,filename.length-1);

var file = path + "\\" + filename;

var fso = new ActiveXObject("Scripting.FileSystemObject");
if (dirFlag) {
    var f = fso.GetFolder(file);
}
else {
    var f = fso.GetFile(file);
}

if (Request.Form.Key("chka")!="")
    f.Attributes = f.Attributes | attArchive;
else
    f.Attributes = f.Attributes & (~attArchive);

if (Request.Form.Key("chks")!="")
    f.Attributes = f.Attributes | attSystem;
else
    f.Attributes = f.Attributes & (~attSystem);

if (Request.Form.Key("chkh")!="")
    f.Attributes = f.Attributes | attHidden;
else
    f.Attributes = f.Attributes & (~attHidden);

if (Request.Form.Key("chkr")!="")
    f.Attributes = f.Attributes | attReadOnly;
else
    f.Attributes = f.Attributes & (~attReadOnly);

fso = null;

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);

%>