<%
if (typeof(ResetFlag)!="boolean") Response.End();

var fldFileName = Tag({
    "tag"   : "INPUT",
    "name"  : "filename",
    "class" : "flat",
    "size"  : "50"
});

var fldText = Tag({
    "tag"   : "TEXTAREA",
    "name"  : "filetext",
    "class" : "flat",
    "cols"  : "90",
    "rows"  : "20"
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

var tblNew = Tag({
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
                    "inside" : "<B>New File</B>"
                })
        }) +
        Tag({
            "tag"     : "TR",
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "inside" : "File Name:"
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
            "class"   : "line",
            "bgcolor" : "#F2F2F2",
            "inside"  :
                Tag({
                    "tag"    : "TD",
                    "inside" : "File Content:"
                })
        }) +
        Tag({
            "tag"    : "TR",
            "class"  : "line",
            "bgcolor": "#F2F2F2",
            "inside" :
                Tag({
                    "tag"    : "TD",
                    "inside" : fldText
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
var js = readFile(Server.MapPath("new.js"));
js = Template(js, {"url":"index.asp?"+getQueryString(params)});

params["cmd"] = "save";
var newForm = Tag({
    "tag"     : "FORM",
    "method"  : "post",
    "name"    : "newform",
    "action"  : "index.asp?"+getQueryString(params),
    "onsubmit": "return checkForm(this);",
    "inside"  : tblNew
});

CONTENT =  js;
CONTENT += newForm;
%>