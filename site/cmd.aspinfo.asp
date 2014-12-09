<%
if (typeof(ResetFlag)!="boolean") Response.End();

var version = readFile(Server.MapPath("version.txt"));

CONTENT = "<H1 class=\"title\" align=\"center\">" + TITLE[0] + " " + version + "</H1>\n";
CONTENT += aspInfo();
%>