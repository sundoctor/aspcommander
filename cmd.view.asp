<%
if (typeof(ResetFlag)!="boolean") Response.End();

var filename = Request.QueryString.Key("filename")!=""?
               "" + Request.QueryString("filename") : "";

var file = path + "\\" + filename;

if (fileExists(file)) {

    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var ext = fso.GetExtensionName(file);
    ext = ext.toLowerCase();
    var ContentType = "text/plain";
    if (ext=='gif')       ContentType = "image/gif";
    else if (ext=='jpg')  ContentType = "image/jpeg";
    else if (ext=='jpeg') ContentType = "image/jpeg";
    else if (ext=='png')  ContentType = "image/png";
    else if (ext=='bmp')  ContentType = "image/bmp";
    else if (ext=='html') ContentType = "text/html";
    else if (ext=='htm')  ContentType = "text/html";
    else if (ext=='txt')  ContentType = "text/plain";

    Response.Clear();
    Response.ContentType = ContentType;
    Response.AddHeader("Content-Disposition", "filename=\"" + filename + "\"");
    var Stream = new ActiveXObject("ADODB.Stream");
    Stream.Type = 1; // Binary
    Stream.Open();
    Stream.LoadFromFile(file);
    Response.BinaryWrite(Stream.Read);
    Stream.Close
    Response.End();

}

%>