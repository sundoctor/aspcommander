<%@ LANGUAGE=JScript %>
<!--#include file="config.inc.asp"-->
<!--#include file="md5.asp"-->
<!--#include file="arrays.asp" -->
<!--#include file="files.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="aspinfo.asp" -->
<!--#include file="time.asp" -->
<%

// Initialization flag
var ResetFlag = Request.QueryString.Key("reset")!=""? true : false;

// Date-Time
var now = IsoDateTime();

// Set up session
if (Session("bufAction")==null)  Session("bufAction")  = "";
if (Session("bufSrcPath")==null) Session("bufSrcPath") = "";
if (Session("bufFiles")==null)   Session("bufFiles")   = "";

// Start directory
var STARTDIR = Server.MapPath(".");

// Sort types
var sorts = [
    'nameaz', 'nameza',
    'extaz',  'extza',
    'sizeaz', 'sizeza',
    'dateaz', 'dateza'
];

var sort = Request.QueryString.Key("sort")!=""?
           "" + Request.QueryString("sort"): "nameaz";

var sortord = sort.substring(0,sort.length-2);
var sortdir = sort.substr(sort.length-2,2);

// Path
var path = Request.QueryString.Key("path")!=""?
           "" + Request.QueryString("path"): STARTDIR;

if (BASEPATH!="" && path.indexOf(BASEPATH)!=0) path = BASEPATH;


while (!folderExists(path)) {
   var p = path.lastIndexOf('\\');
   if (p==-1) break;
   path = path.substr(0,p);
}

// Parse command
var cmd = "list";
if (Request.QueryString.Key("cmd")!="") {
    cmd = "" + Request.QueryString("cmd");
}
if (Request.ServerVariables("REQUEST_METHOD")=="POST") {
    if (Request.QueryString.Key("cmd")=="" && Request.Form.Key("cmd")!="") {
        cmd = "" + Request.Form("cmd");
    }
}

if (Session("login")==null && cmd!="logon") cmd = "login";

var params = {
    "cmd"  : "list",
    "path" : path,
    "sort" : sort
};

// Command switch
%><!--#include file="menu.inc.asp"--><%
if (cmd == "login") {
%><!--#include file="cmd.login.asp"--><%
} else if (cmd == "logon") {
%><!--#include file="cmd.logon.asp"--><%
} else if (cmd == "logout") {
%><!--#include file="cmd.logout.asp"--><%
} else if (cmd == "aspinfo") {
%><!--#include file="cmd.aspinfo.asp"--><%
} else if (cmd == "list") {
%><!--#include file="cmd.list.asp"--><%
} else if (cmd == "view") {
%><!--#include file="cmd.view.asp"--><%
} else if (cmd == "new") {
%><!--#include file="cmd.new.asp"--><%
} else if (cmd == "save") {
%><!--#include file="cmd.save.asp"--><%
} else if (cmd == "edit") {
%><!--#include file="cmd.edit.asp"--><%
} else if (cmd == "update") {
%><!--#include file="cmd.update.asp"--><%
} else if (cmd == "download") {
%><!--#include file="cmd.download.asp"--><%
} else if (cmd == "newname") {
%><!--#include file="cmd.newname.asp"--><%
} else if (cmd == "rename") {
%><!--#include file="cmd.rename.asp"--><%
} else if (cmd == "remove") {
%><!--#include file="cmd.remove.asp"--><%
} else if (cmd == "newdir") {
%><!--#include file="cmd.newdir.asp"--><%
} else if (cmd == "mkdir") {
%><!--#include file="cmd.mkdir.asp"--><%
} else if (cmd == "upload") {
%><!--#include file="cmd.upload.asp"--><%
} else if (cmd == "cut") {
%><!--#include file="cmd.cut.asp"--><%
} else if (cmd == "copy") {
%><!--#include file="cmd.copy.asp"--><%
} else if (cmd == "paste") {
%><!--#include file="cmd.paste.asp"--><%
} else if (cmd == "clear") {
%><!--#include file="cmd.clear.asp"--><%
} else if (cmd == "attr") {
%><!--#include file="cmd.attr.asp"--><%
} else if (cmd == "setattr") {
%><!--#include file="cmd.setattr.asp"--><%
}

%>
<!--#include file="page.inc.asp"-->