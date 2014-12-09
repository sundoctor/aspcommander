<%

if (OUTPUT!="") {
    Response.Write(OUTPUT);
    Response.End();
}
if (LOCATION!="") {
    Response.Redirect(LOCATION);
    Response.End();
}
{
    var tpl = readFile(Server.MapPath(TEMPLATE));
    var p = {
        'title'       : TITLE.join(' ~ '),
        'description' : DESCRIPTION,
        'keywords'    : KEYWORDS,
        'content'     : CONTENT

    };
    OUTPUT = Template(tpl,p);
    for(var key in CONST) {
        var re = new RegExp("#" + key,"ig");
        OUTPUT = OUTPUT.replace(re, CONST[key]);
    }
    Response.Write(OUTPUT);
}

%>