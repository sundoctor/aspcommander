<%
////////////////////////////////////////////////////////////////////////////////
// CONFIGURATION
////////////////////////////////////////////////////////////////////////////////

// Login : Password
// (admin : admin)
var USERS = {
    "admin" : "21232f297a57a5a743894a0e4a801fc3"
};

////////////////////////////////////////////////////////////////////////////////
// Do not touch below this line
////////////////////////////////////////////////////////////////////////////////

var TITLE          = ["ASP Commander"];
var KEYWORDS       = "";
var DESCRIPTION    = "";

// Constants
var CONST = {
    "email"   : "sun-doctor@7masterov.ru",
    "author"  : "(C) Igor Salnikov aka SunDoctor",
    "website" : "http://www.7masters.org"
};

// Execution script time
Server.ScriptTimeout = 90;

// Session life time
Session.Timeout = 20;

var CONTENT        = "";
var TEMPLATE       = "page.html";

// Files hilights
var COLORS = {
    "exe" : "#FF0000",
    "com" : "#FF0000",
    "bat" : "#FF0000",
    "php" : "#6A179B",
    "txt" : "#696969",
    "gif" : "#008000",
    "jpg" : "#008000",
    "png" : "#008000"
};

// Chroot directory
var BASEPATH = "";

// Save log file or not
var SAVE_LOG = true;

// Protect "<>" by default
var SAFE_CHARS = true;

// Transform \n into <BR> by default
var FORMAT_N2BR = false;

// Date-time default format
var DATETIME_FORMAT = ["yyyy","-","mm","-","dd"," ","hh",":","ii"];

// Do not split datetime by BR
var DATETIME_NOBR = true;

// Sort buttons
var SORT_AZ = "<IMG SRC=\"az.gif\" WIDTH=13 HEIGHT=9 BORDER=0 ALT=\"Sort A-Z\">";
var SORT_ZA = "<IMG SRC=\"za.gif\" WIDTH=13 HEIGHT=9 BORDER=0 ALT=\"Sort Z-A\">";

// Control buttons
var ICO_FILE      = "<IMG SRC=\"file.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"\">";
var ICO_SPACE     = "<IMG SRC=\"space.gif\" WIDTH=5 HEIGHT=15 BORDER=0 ALT=\"\">";
var CMD_INFO      = "<IMG SRC=\"info.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Information\">";
var CMD_NEW       = "<IMG SRC=\"new.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"New File\">";
var CMD_REFRESH   = "<IMG SRC=\"refresh.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Refresh\">";
var CMD_VIEW      = "<IMG SRC=\"view.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"View File\">";
var CMD_EDIT      = "<IMG SRC=\"edit.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Edit File\">";
var CMD_REMOVE    = "<IMG SRC=\"remove.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Remove File\">";
var CMD_RENAME    = "<IMG SRC=\"rename.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Rename File\">";
var CMD_ATTR      = "<IMG SRC=\"attr.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Set Attributes\">";
var CMD_HOME      = "<IMG SRC=\"home.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Start Page\">";
var CMD_EXIT      = "<IMG SRC=\"exit.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Quit Session\">";
var CMD_SEND      = "<IMG SRC=\"send.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Send File\">";
var CMD_CHECK     = "<IMG SRC=\"check.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Check All\">";
var CMD_UNCHECK   = "<IMG SRC=\"uncheck.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Check None\">";
var CMD_XCHECK    = "<IMG SRC=\"xcheck.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Check Invert\">";
var CMD_CLEAR     = "<IMG SRC=\"clear.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Clear clipboard buffer\">";
var CMD_CUT       = "<IMG SRC=\"cut.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Cut\">";
var CMD_COPY      = "<IMG SRC=\"copy.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Copy\">";
var CMD_PASTE     = "<IMG SRC=\"paste.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"Paste\">";
var CMD_MKDIR     = "<IMG SRC=\"folder.gif\" WIDTH=15 HEIGHT=15 BORDER=0 ALT=\"MkDir\">";

// Max input text length
var MAX_TEXT_LEN = 256000;

// Max file size possible to view
var MAX_VIEW_SIZE = 1024*100*3;

var INPUT    = "";
var OUTPUT   = "";
var LOCATION = "";

%>