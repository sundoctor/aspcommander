<%
if (typeof(ResetFlag)!="boolean") Response.End();

var filename = Request.QueryString.Key("filename")!=""?
               "" + Request.QueryString("filename") : "";

var file = path + "\\" + filename;

if (fileExists(file)) {

    Response.Clear();
    Response.ContentType = "application/octet-stream";
    Response.Expires = 0;
    Response.addHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
    var Stream = new ActiveXObject("ADODB.Stream");
    Stream.Type = 1; // Binary
    Stream.Open();
    Stream.LoadFromFile(file);
    Response.BinaryWrite(Stream.Read);
    Stream.Close
    Response.End();
}

%>