<%
if (typeof(ResetFlag)!="boolean") Response.End();

var login = Request.Form.Key("login")!=""?
                "" + Request.Form("login") : "";

var password = Request.Form.Key("password")!=""?
                "" + Request.Form("password") : "";

var Correct = false;

var password_md5 = ""+password.md5();

for(var key in USERS) {
    var test = key.toLowerCase()==login.toLowerCase() &&
               USERS[key]==password_md5;
    if (test) {
        Correct = true;
        Session("login") = key;
        LOCATION = "index.asp";
        break;
    }
}

// Save event to log
if (Correct && SAVE_LOG) {
    var thisDate = getFormatDate(["yyyy","-","mm","-","dd"," ","hh",":","ii"]);
    var filename = getFormatDate(["yyyy","-","mm"])+".log";
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var f = fso.OpenTextFile(Server.MapPath(filename), ForAppending, true);
    f.WriteLine("["+thisDate+"] LOGIN  "+Session("login"));
    f.Close();
    f = null;
    fso = null;
}

if (!Correct) {
    LOCATION = "index.asp?cmd=login&login="+login;
}

%>