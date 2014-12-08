<%
if (typeof(ResetFlag)!="boolean") Response.End();

var oldname = Request.Form.Key("oldname")!=""?
               "" + Request.Form("oldname") : "";
var filename = Request.Form.Key("filename")!=""?
               "" + Request.Form("filename") : "";

var dirFlag = (oldname.substr(0,1)=="D");

oldname = oldname.substr(1,oldname.length-1);

var oldfile = path + "\\" + oldname;
var newfile = path + "\\" + filename;

if (filename!="" && oldname!="" && oldfile!=newfile) {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    if (dirFlag) {
        if (!folderExists(newfile)) {
            fso.MoveFolder(oldfile, newfile);
        }
    }
    else {
        if (!fileExists(newfile)) {
            fso.MoveFile(oldfile, newfile);
        }
    }
}

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);
%>