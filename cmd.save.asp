<%
if (typeof(ResetFlag)!="boolean") Response.End();

var filename = Request.Form.Key("filename")!=""?
               "" + Request.Form("filename") : "";

var filetext = Request.Form.Key("filetext")!=""?
               "" + Request.Form("filetext") : "";

var file = path + "\\" + filename;
if (!fileExists(file)) {
    saveFile(file, filetext);
}

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);
%>