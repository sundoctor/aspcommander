<!--#include file="urldecode.asp"-->
<%
if (typeof(ResetFlag)!="boolean") Response.End();

var fn = Request.Form.Key("file[]")!=""?
               "" + Request.Form("file[]") : "";
var filename = "" + fn;
filename = filename.substr(1,filename.length-1);
var filename = URLDecode(filename);

var fldFileName = Tag({
    "tag"   : "INPUT",
    "name"  : "filename",
    "class" : "flat",
    "size"  : "50"
});

var btnSubmit = Tag({
    "tag"   : "INPUT",
    "type"  : "submit",
    "class" : "flat",
    "value" : " Rename "
});

var btnBack = Tag({
    "tag"     : "INPUT",
    "type"    : "button",
    "class"   : "flat",
    "value"   : " Back ",
    "onclick" : "javascript:cmdGoBack()"
});

var tblRename = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "4",
    "cellspacing" : "1",
    "inside"      :
        Tag({
            "tag"     : "TR",
            "class"   : "line",
            "bgcolor" : "#D7D7FF",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "inside" : "<B>Rename File</B>"
                })
        }) +
        Tag({
            "tag"     : "TR",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "inside" : "Rename file [" + filename + "] to:"
                })
        }) +
        Tag({
            "tag"   : "INPUT",
            "type"  : "hidden",
            "name"  : "oldname",
            "value" : fn
        }) +
        Tag({
            "tag"    : "TR",
            "class"  : "line",
            "bgcolor": "#F2F2F2",
            "inside" :
                Tag({
                    "tag"    : "TD",
                    "inside" : fldFileName
                })
        }) +
        Tag({
            "tag"     : "TR",
            "align"   : "center",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "inside" : btnSubmit + btnBack
                })
        })
});

params["cmd"] = "list";
var js = readFile(Server.MapPath("rename.js"));
js = Template(js, {"url":"index.asp?"+getQueryString(params)});


params["cmd"] = "rename";
var newForm = Tag({
    "tag"     : "FORM",
    "method"  : "post",
    "name"    : "renameform",
    "action"  : "index.asp?"+getQueryString(params),
    "onsubmit": "return checkForm(this);",
    "inside"  : tblRename
});

CONTENT =  js;
CONTENT += newForm;
%>