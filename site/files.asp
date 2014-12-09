<%
//////////////////////////////////////////////////////////////////////
//
// Files v1.1
//
// Files functions
//
// File    : strings.asp
// Version : 1.1
// Source  : JScript
//
// Windows 2000 Professional
// Windows 2000 Advanced Server
// Internet Information Server
//
// Include this file only one time!
//
// Igor Salnikov aka SunDoctor, Copyright(C)
//
// Error found? Nothing is perfect...
//
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// #const ForReading = 1
//      Open file for reading
// #const ForWriting = 2
//      Open file for writting
//////////////////////////////////////////////////////////////////////
var ForReading   = 1;
var ForWriting   = 2;
var ForAppending = 8;

var _DRIVETYPE = {
    0: "Unknown",
    1: "Removable",
    2: "Fixed",
    3: "Network",
    4: "CD-ROM",
    5: "RAM Disk"
};

var dtUnknown   = 0;
var dtRemovable = 1;
var dtFixed     = 2;
var dtNetwork   = 3;
var dtCDROM     = 4;
var dtRamDisk   = 5;

var attNormal     = 0;
var attReadOnly   = 1;
var attHidden     = 2;
var attSystem     = 4;
var attVolume     = 8;
var attDirectory  = 16;
var attArchive    = 32;
var attAlias      = 64;
var attCompressed = 128;


//////////////////////////////////////////////////////////////////////
// #function Boolean fileExists(String fileName)
//      Check file exists
// #param String fileName
//      Filename with or without path
// #return Boolean
//      true = exists, false = not exists
//////////////////////////////////////////////////////////////////////
function fileExists(fileName) {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    if (fso.FileExists(fileName)) {
        return true;
    }
    return false;
}

function folderExists(folderName) {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    if (fso.FolderExists(folderName)) {
        return true;
    }
    return false;
}


//////////////////////////////////////////////////////////////////////
// #function String readFile(String fileName)
//      Read whole file
// #param String fileName
//      File name to read
// #return String
//      File content joined in one big string
//////////////////////////////////////////////////////////////////////
function readFile(fileName) {
    var content = "";
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    if (fso.FileExists(fileName)) {
        var f = fso.OpenTextFile(fileName, ForReading);
        content = f.ReadAll();
        f.Close();
        return(content);
    }
    return '';
}

//////////////////////////////////////////////////////////////////////
// #function Void saveFile(String fileName, String content)
//      Save whole file
// #param String fileName
//      File to write. Overwritting enabled!!!
// #param String content
//      Text string to write
// #return Void
//////////////////////////////////////////////////////////////////////
function saveFile(fileName, content) {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var f = fso.CreateTextFile(fileName, true);
    f.Write(content);
    f.Close();
}

%>