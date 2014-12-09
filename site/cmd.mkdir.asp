<%
if (typeof(ResetFlag)!="boolean") Response.End();

var filename = Request.Form.Key("filename")!=""?
               "" + Request.Form("filename") : "";

var file = path + "\\" + filename;

if (!folderExists(file)) {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    fso.CreateFolder(file);
}

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);
%>