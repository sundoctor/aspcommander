<%
if (typeof(ResetFlag)!="boolean") Response.End();

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
    "value" : " MkDir "
});

var btnBack = Tag({
    "tag"     : "INPUT",
    "type"    : "button",
    "class"   : "flat",
    "value"   : " Back ",
    "onclick" : "javascript:cmdGoBack()"
});

var tblMkDir = Tag({
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
                    "inside" : "<B>Make new directory</B>"
                })
        }) +
        Tag({
            "tag"     : "TR",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "inside" : "Input directory name:"
                })
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
var js = readFile(Server.MapPath("mkdir.js"));
js = Template(js, {"url":"index.asp?"+getQueryString(params)});


params["cmd"] = "mkdir";
var form = Tag({
    "tag"     : "FORM",
    "method"  : "post",
    "name"    : "mkdirform",
    "action"  : "index.asp?"+getQueryString(params),
    "onsubmit": "return checkForm(this);",
    "inside"  : tblMkDir
});

CONTENT =  js;
CONTENT += form;
%>