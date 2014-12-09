<%
if (typeof(ResetFlag)!="boolean") Response.End();

// Save event to log
if (SAVE_LOG) {
    var thisDate = getFormatDate(["yyyy","-","mm","-","dd"," ","hh",":","ii"]);
    var filename = getFormatDate(["yyyy","-","mm"])+".log";
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var f = fso.OpenTextFile(Server.MapPath(filename), ForAppending, true);
    f.WriteLine("["+thisDate+"] LOGOUT "+Session("login"));
    f.Close();
}

Session("login") = null;
Session.Abandon();
LOCATION = "index.asp";

%>