<!--#include file="urldecode.asp"-->
<%
if (typeof(ResetFlag)!="boolean") Response.End();

var filename = Request.Form.Key("file[]")!=""?
               "" + Request.Form("file[]") : "";

var filename = URLDecode(filename);
    filename = filename.substr(1,filename.length-1);

var file = path + "\\" + filename;

if (fileExists(file)) {
    var content = readFile(file);

    var fldText = Tag({
        "tag"    : "TEXTAREA",
        "name"   : "filetext",
        "class"  : "flat",
        "cols"   : "90",
        "rows"   : "20",
        "inside" : Server.HTMLEncode(content)

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

    var tblEdit = Tag({
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
                        "inside" : "<B>File: " + filename + "</B>"
                    })
            }) +
            Tag({
                "tag"   : "INPUT",
                "type"  : "hidden",
                "name"  : "filename",
                "value" : Server.HTMLEncode(filename)
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
    var js = readFile(Server.MapPath("edit.js"));
    js = Template(js, {"url":"index.asp?"+getQueryString(params)});

    params["cmd"] = "update";
    var form = Tag({
        "tag"    : "FORM",
        "method" : "post",
        "name"   : "newform",
        "action" : "index.asp?"+getQueryString(params),
        "inside" : tblEdit
    });

    CONTENT =  js;
    CONTENT += form;

} // if file exists
else {
    Response.Write("File [" + file + "] not found");
}
%>