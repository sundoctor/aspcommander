<%
if (typeof(ResetFlag)!="boolean") Response.End();

var bufAction  = Session("bufAction")!=null?""+Session("bufAction"):"";
var bufFiles   = Session("bufFiles")!=null?""+Session("bufFiles"):"";
var from       = Session("bufSrcPath")!=null?""+Session("bufSrcPath"):"";
var to         = path;
var bufFiles   = bufFiles.split("*");
var fso = new ActiveXObject("Scripting.FileSystemObject");

// Copy
if (bufAction=="copy") {
    if (from!=to) {
        for(var i=0;i<bufFiles.length;i++) {
            var fn = bufFiles[i];
            var dirFlag = (fn.substr(0,1)=="D");
            fn = fn.substr(1,fn.length-1);
            if (dirFlag) {
                fso.CopyFolder(from+"\\"+fn,to+"\\"+fn);
            } else {
                fso.CopyFile(from+"\\"+fn,to+"\\"+fn);
            }
        }
    }
}
// Move
else {
    if (from!=to) {
        for(var i=0;i<bufFiles.length;i++) {
            var fn = bufFiles[i];
            var dirFlag = (fn.substr(0,1)=="D");
            fn = fn.substr(1,fn.length-1);
            if (dirFlag) {
                fso.MoveFolder(from+"\\"+fn,to+"\\"+fn);
            } else {
                fso.MoveFile(from+"\\"+fn,to+"\\"+fn);
            }
        }
    }
}

Session("bufAction")  = "";
Session("bufSrcPath") = "";
Session("bufFiles")   = "";

params["cmd"] = "list";
LOCATION = "index.asp?" + getQueryString(params);

%>