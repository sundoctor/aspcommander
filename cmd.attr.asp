<!--#include file="urldecode.asp"-->
<%
if (typeof(ResetFlag)!="boolean") Response.End();

var fn = Request.Form.Key("file[]")!=""?
         "" + Request.Form("file[]") : "";

var filename = URLDecode(fn);

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
var attr = f.Attributes;

var chkReadOnly = Tag({
    "tag"     : "INPUT",
    "type"    : "checkbox",
    "name"    : "chkr",
    "value"   : ""+attReadOnly,
    "checked" : attr&attReadOnly?"yes":""
});
var chkHidden = Tag({
    "tag"     : "INPUT",
    "type"    : "checkbox",
    "name"    : "chkh",
    "value"   : ""+attHidden,
    "checked" : attr&attHidden?"yes":""
});
var chkSystem = Tag({
    "tag"     : "INPUT",
    "type"    : "checkbox",
    "name"    : "chks",
    "value"   : ""+attSystem,
    "checked" : attr&attSystem?"yes":""
});
var chkArchive = Tag({
    "tag"     : "INPUT",
    "type"    : "checkbox",
    "name"    : "chka",
    "value"   : ""+attArchive,
    "checked" : attr&attArchive?"yes":""
});


var btnSubmit = Tag({
    "tag"   : "INPUT",
    "type"  : "submit",
    "class" : "flat",
    "value" : " Save "
});

var btnBack = Tag({
    "tag"     : "INPUT",
    "type"    : "button",
    "class"   : "flat",
    "value"   : " Back ",
    "onclick" : "javascript:cmdGoBack()"
});

var tblAttr = Tag({
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
                    "colspan": "4",
                    "inside" : "<B>File attributes</B>"
                })
        }) +
        Tag({
            "tag"     : "TR",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "align"  : "center",
                    "inside" : chkReadOnly
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" : "ReadOnly"
                }) +
                Tag({
                    "tag"    : "TD",
                    "align"  : "center",
                    "inside" : chkSystem
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" : "System"
                })
        }) +
        Tag({
            "tag"     : "TR",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "align"  : "center",
                    "inside" : chkHidden
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" : "Hidden"
                }) +
                Tag({
                    "tag"    : "TD",
                    "align"  : "center",
                    "inside" : chkArchive
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" : "Archive"
                })
        }) +
        Tag({
            "tag"   : "INPUT",
            "type"  : "hidden",
            "name"  : "filename",
            "value" : fn
        }) +
        Tag({
            "tag"     : "TR",
            "align"   : "center",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "colspan": "4",
                    "inside" : btnSubmit + btnBack
                })
        })
});

params["cmd"] = "list";
var js = readFile(Server.MapPath("attr.js"));
js = Template(js, {"url":"index.asp?"+getQueryString(params)});

params["cmd"] = "setattr";
var form = Tag({
    "tag"     : "FORM",
    "method"  : "post",
    "name"    : "newform",
    "action"  : "index.asp?"+getQueryString(params),
    "onsubmit": "return checkForm(this);",
    "inside"  : tblAttr
});

CONTENT =  js;
CONTENT += form;

%>