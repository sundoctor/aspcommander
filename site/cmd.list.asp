<%
if (typeof(ResetFlag)!="boolean") Response.End();

// FILE SORT

// Compare two names
function cmpTwoNames(a, b) {
    if (a["name"]==b["name"]) return 0;
    if (a["name"]=="..") return -1;
    if (b["name"]=="..") return 1;
    return (a["name"] < b["name"]) ? -1 : 1;
}

// Sort by filename
function cmpName (a, b) {
    // Both are files
    if (a["type"]!="D" && b["type"]!="D") {
        if (sortdir=="az")
            return (a["name"] < b["name"]) ? -1 : 1;
        else
            return (a["name"] > b["name"]) ? -1 : 1;
    }
    // Both are directories
    else if (a["type"]=="D" && b["type"]=="D") {
        return cmpTwoNames(a,b);
    }
    // First is directory, second is file
    else if (a["type"]=="D" && b["type"]!="D")
        return -1;
    // First is file, second is directory
    else if (a["type"]!="D" && b["type"]=="D")
        return 1;
}

// Sort by extension
function cmpExt(a, b) {
    // Both are dorectories or both are files
    if ((a["type"]=="D" && b["type"]=="D") ||
        (a["type"]!="D" && b["type"]!="D")) {
        if (a["ext"] == b["ext"])
             return cmpTwoNames(a,b);
        if (sortdir=="az")
            return (a["ext"] < b["ext"]) ? -1 : 1;
        else
            return (a["ext"] > b["ext"]) ? -1 : 1;
    }
    // First is directory, second is file
    else if (a["type"]=="D" && b["type"]!="D")
        return -1;
    // First is file, second is directory
    else if (a["type"]!="D" && b["type"]=="D")
        return 1;
}

// Sort by size
function cmpSize(a, b) {
    // Both are files
    if (a["type"]!="D" && b["type"]!="D") {
        if (a["size"] == b["size"])
            return cmpTwoNames(a,b);
        if (sortdir=="az")
            return (a["size"] < b["size"]) ? -1 : 1;
        else
            return (a["size"] > b["size"]) ? -1 : 1;
    }
    // Both are directories
    else if (a["type"]=="D" && b["type"]=="D") {
        return cmpTwoNames(a,b);
    }
    // First is directory, second is file
    else if (a["type"]=="D" && b["type"]!="D")
        return -1;
    // First is file, second is directory
    else if (a["type"]!="D" && b["type"]=="D")
        return 1;
}

// Sort by date
function cmpDate(a, b) {
    // Both are files
    if (a["type"]!="D" && b["type"]!="D") {
        if (a["date"] == b["date"])
            return cmpTwoNames(a,b);
        if (sortdir=="az")
            return (a["date"] < b["date"]) ? -1 : 1;
        else
            return (a["date"] > b["date"]) ? -1 : 1;
    }
    // Both are directories
    else if (a["type"]=="D" && b["type"]=="D") {
        return cmpTwoNames(a,b);
    }
    // First is directory, second is file
    else if (a["type"]=="D" && b["type"]!="D")
        return -1;
    // First is file, second is directory
    else if (a["type"]!="D" && b["type"]=="D")
        return 1;
}


// Get filename without extension
function getFileName(fileName, attrs) {
    if (attrs & attDirectory) return fileName;
    var p = fileName.lastIndexOf(".");
    if (p!=-1) return fileName.substr(0,p);
    return fileName;
}

// Get file extension without filename
function getFileExt(fileName, attrs) {
    if (attrs & attDirectory) return "[DIR]";
    var p = fileName.lastIndexOf(".");
    if (p!=-1) return "."+fileName.substring(p+1,fileName.length);
    return "";
}

// Get file type (dir (D) / file (F))
function getFileType(fileName, attrs) {
    if (attrs & attDirectory) return "D";
    return "F";
}

// Transform attrs to string [drahs]
function strAttrs(attrs) {
    var result = "";
    if (attrs & attDirectory) result += "d"; else result +="-";
    if (attrs & attReadOnly) result += "r"; else result +="-";
    if (attrs & attArchive) result += "a"; else result +="-";
    if (attrs & attHidden) result += "h"; else result +="-";
    if (attrs & attSystem) result += "s"; else result +="-";
    return result;
}

// Transform plain file to HTML
function file2html(path, fileinfo, params) {
    // file
    if (fileinfo["type"] != "D")
        return fileinfo["name"];
    // directory
    else {
        var jump = path;
        if (path.substr(path.length-1,1)!="\\") jump += "\\";
        jump += ""+fileinfo["fullname"];
        if (fileinfo["name"]=="..") {
            // get short file path
            var a = path.split("\\");
            if (a.length>0) a.length--;
            jump = a.join("\\",a);
            if (jump.length<3) jump+="\\";
        }
        var p = {}; for(var k in params) p[k]=params[k];
        p["path"] = jump;
        return Tag({
            "tag"    : "A",
            "href"   : "index.asp?"+getQueryString(p),
            "inside" : ""+fileinfo["name"]
        });
    }
}


// Get file list
var files = [];
var fso = new ActiveXObject("Scripting.FileSystemObject");

try {

var folder = fso.GetFolder(path);

var created = "";
try { created = IsoDateTime(folder.DateCreated); } catch(E) {}
var accessed = "";
try { accessed = IsoDateTime(folder.DateLastAccessed); } catch(E) {}
var modified = "";
try { modified = IsoDateTime(folder.DateLastModified); } catch(E) {}

if (path.length>3)
files[files.length] = {
        "fullname" : "..",
        "name"     : "..",
        "ext"      : getFileExt(folder.Name, folder.Attributes),
        "type"     : getFileType(folder.Name, folder.Attributes),
        "date"     : created,
        "accessed" : accessed,
        "modified" : modified,
        "size"     : getFileType(folder.Name, folder.Attributes)!="D"?folder.Size:0,
        "attr"     : folder.Attributes,
        "strattr"  : strAttrs(folder.Attributes)
};

// Get dir list
var list = new Enumerator(folder.SubFolders);
var file;
for (list.moveFirst(); !list.atEnd(); list.moveNext()) {
    file = list.item();
    var created = "";
    try { created = IsoDateTime(folder.DateCreated); } catch(E) {}
    var accessed = "";
    try { accessed = IsoDateTime(folder.DateLastAccessed); } catch(E) {}
    var modified = "";
    try { modified = IsoDateTime(folder.DateLastModified); } catch(E) {}
    files[files.length] = {
        "fullname" : file.Name,
        "name"     : getFileName(file.Name, file.Attributes),
        "ext"      : getFileExt(file.Name, file.Attributes),
        "type"     : getFileType(file.Name, file.Attributes),
        "date"     : created,
        "accessed" : accessed,
        "modified" : modified,
        "size"     : getFileType(folder.Name, folder.Attributes)!="D"?folder.Size:0,
        "attr"     : file.Attributes,
        "strattr"  : strAttrs(file.Attributes)
    };
}

// Get files
var list = new Enumerator(folder.files);
var file;
for (list.moveFirst(); !list.atEnd(); list.moveNext()) {
    file = list.item();
    files[files.length] = {
        "fullname" : file.Name,
        "name"     : getFileName(file.Name, file.Attributes),
        "ext"      : getFileExt(file.Name, file.Attributes),
        "type"     : getFileType(file.Name, file.Attributes),
        "date"     : IsoDateTime(file.DateCreated),
        "accessed" : IsoDateTime(file.DateLastAccessed),
        "modified" : IsoDateTime(file.DateLastModified),
        "size"     : file.Size,
        "attr"     : file.Attributes,
        "strattr"  : strAttrs(file.Attributes)
    };
}

// Get drives
var list = new Enumerator(fso.Drives);
var file;
var opts = "";
for (list.moveFirst(); !list.atEnd(); list.moveNext()) {
    file = list.item();
    opts += Tag({
        "tag"      : "OPTION",
        "value"    : Server.URLEncode(file.DriveLetter.toUpperCase()+":\\"),
        "selected" : file.DriveLetter.toUpperCase()==path.substr(0,1).toUpperCase()?"yes":"",
        "inside"   : file.DriveLetter.toUpperCase()
    }) + "\n";
}

var selDisk = Tag({
    "tag"      : "SELECT",
    "onchange" : "goUrl(this.options[this.selectedIndex].value)",
    "inside"   : opts
});

// Sorting
switch (sortord) {
    case "name" : files.sort(cmpName); break;
    case "ext"  : files.sort(cmpExt);  break;
    case "size" : files.sort(cmpSize); break;
    case "date" : files.sort(cmpDate); break;
}


// Output to screen

var trs = "";
for(var i=0;i<files.length;i++) {
    var chkname = "file[]";
    var disable = "";
    if (files[i]["name"]=="..") { chkname=""; disable="yes"; }
    var chk = Tag({
        "tag"     : "INPUT",
        "type"    : "checkbox",
        "name"    : chkname,
        "value"   : files[i]["type"] + Server.URLEncode(files[i]["fullname"]),
        "disabled": disable
    });

    var td_chk = Tag({
        "tag"    : "TD",
        "align"  : "center",
        "inside" : chk
    });
    var td_attr = Tag({
        "tag"    : "TD",
        "class"  : "listdata",
        "inside" : files[i]["strattr"]
    });
    var td_name = Tag({
        "tag"    : "TD",
        "class"  : "listdata",
        "inside" : file2html(path, files[i], params)
    });
    var td_ext = Tag({
        "tag"    : "TD",
        "class"  : "listdata",
        "inside" : files[i]["ext"] + "&nbsp;"
    });
    var td_size = Tag({
        "tag"    : "TD",
        "class"  : "listdata",
        "align"  : "right",
        "inside" : files[i]["size"] + "&nbsp;"
    });
    var td_date = Tag({
        "tag"    : "TD",
        "class"  : "listdata",
        "align"  : "right",
        "inside" : files[i]["date"] + "&nbsp;"
    });
    var bgcolor = (i%2==0?"#F2F2F2":"#FFFFFF");

    // Check file in buffer (clipboard)
    var bufFiles   = Session("bufFiles")!=null?""+Session("bufFiles"):"";
    var bufFiles   = bufFiles.split("*");
    var test = (path==(""+Session("bufSrcPath")) &&
                inArray(bufFiles,files[i]["type"]+files[i]["fullname"]));
    if (test) bgcolor = "#FFFFC0";

    var tr = Tag({
        "tag"     : "TR",
        "bgcolor" : bgcolor,
        "class"   : "line",
        "onmouseover" : "setLineColor(this,'#C5FAEA')",
        "onmouseout"  : "setLineColor(this,'"+bgcolor+"')",
        "inside"  :
            td_chk + "\n" +
            td_attr + "\n" +
            td_name + "\n" +
            td_ext + "\n" +
            td_size + "\n" +
            td_date + "\n"
    });
    trs += tr + "\n";
} // for

var trm = Tag({
    "tag"     : "TR",
    "inside"  :
        Tag({
            "tag"     : "TD",
            "bgcolor": "#FFFFC0",
            "colspan" : "6",
            "inside"  : tblMenuPanel
        })
});

// Titles
var trh = Tag({
    "tag"     : "TR",
    "bgcolor" : "#D7D7FF",
    "class"   : "line",
    "align"   : "center",
    "inside"  :
        Tag({
            "tag"    : "TD",
            "inside" : selDisk
        }) + "\n" +
        Tag({
            "tag"    : "TD",
            "inside" : "Attrs"
        }) + "\n" +
        Tag({
            "tag"    : "TD",
            "inside" : tblMenuFile
        }) + "\n" +
        Tag({
            "tag"    : "TD",
            "inside" : tblMenuExt
        }) + "\n" +
        Tag({
            "tag"    : "TD",
            "inside" : tblMenuSize
        }) + "\n" +
        Tag({
            "tag"    : "TD",
            "inside" : tblMenuCreated
        })
});

// Table
var tbl = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "2",
    "cellspacing" : "1",
    "inside"      : trm + "\n" + trh + "\n" +
                    trs + "\n" + trm + "\n"
});

var cmdTag = Tag({
    "tag"   : "INPUT",
    "type"  : "hidden",
    "name"  : "cmd",
    "value" : "list"
}) + "\n";

var safePath = Tag({
    "tag"   : "INPUT",
    "type"  : "hidden",
    "name"  : "safepath",
    "value" : Server.URLEncode(path)
}) + "\n";

var safeSort = Tag({
    "tag"   : "INPUT",
    "type"  : "hidden",
    "name"  : "safesort",
    "value" : Server.URLEncode(sort)
}) + "\n";

var showPath = "<B class=\"path\">"+SafeChars(path) + "</B>\n";

var showNow = "<DIV class=\"now\">"+now+"</DIV>\n";

params["cmd"]=null;
var form = Tag({
    "tag"    : "FORM",
    "method" : "post",
    "name"   : "listform",
    "action" : "index.asp?"+getQueryString(params),
    "inside" : showPath + cmdTag + safePath + safeSort + tbl
});


// Upload form

var uploadField = Tag({
    "tag"   : "INPUT",
    "type"  : "file",
    "class" : "flat",
    "name"  : "userfile",
    "size"  : "30"
});

var lnkUpload = Tag({
    "tag"    : "A",
    "href"   : "javascript:document.uploadform.submit()",
    "inside" : "Upload!"

});

// Table
var tblUpload = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "2",
    "cellspacing" : "1",
    "inside"      :
        Tag({
            "tag"    : "TR",
            "inside" :
                Tag({
                    "tag"    : "TD",
                    "inside" : uploadField
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" : lnkUpload
                })
        })
});

params["cmd"]="upload";
var uploadForm = Tag({
    "tag"    : "FORM",
    "method" : "post",
    "name"   : "uploadform",
    "enctype": "multipart/form-data",
    "action" : "index.asp?"+getQueryString(params),
    "inside" : tblUpload
});

CONTENT = readFile(Server.MapPath("menu.js"));
CONTENT += form + uploadForm + showNow;

} catch (e) {
    Response.Write(e.message);
}

%>