<%
if (typeof(ResetFlag)!="boolean") Response.End();

var form = readFile(Server.MapPath("login.html"));

var login = Request.QueryString.Key("login")!=""?
            ""+Request.QueryString("login") : "";

CONTENT = Template(form,{"login" : login});

TEMPLATE = "center.html";

%>