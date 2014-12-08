<%
// Main menu

var p = {
    "cmd" : "list",
    "path": path
};
var tblMenuFile = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "2",
    "cellspacing" : "0",
    "inside"      :
        Tag({
            "tag"    : "TR",
            "class"  : "normal",
            "inside" :
                Tag({
                    "tag" : "TD",
                    "inside" : "File"
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=nameaz",
                            "inside" : SORT_AZ
                        })
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=nameza",
                            "inside" : SORT_ZA
                        })
                })
        })
});


var tblMenuExt = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "2",
    "cellspacing" : "0",
    "inside"      :
        Tag({
            "tag"    : "TR",
            "class"  : "normal",
            "inside" :
                Tag({
                    "tag" : "TD",
                    "inside" : "Ext"
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=extaz",
                            "inside" : SORT_AZ
                        })
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=extza",
                            "inside" : SORT_ZA
                        })
                })
        })
});

var tblMenuSize = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "2",
    "cellspacing" : "0",
    "inside"      :
        Tag({
            "tag"    : "TR",
            "class"  : "normal",
            "inside" :
                Tag({
                    "tag" : "TD",
                    "inside" : "Size"
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=sizeaz",
                            "inside" : SORT_AZ
                        })
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=sizeza",
                            "inside" : SORT_ZA
                        })
                })
        })
});

var tblMenuCreated = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "2",
    "cellspacing" : "0",
    "inside"      :
        Tag({
            "tag"    : "TR",
            "class"  : "normal",
            "inside" :
                Tag({
                    "tag" : "TD",
                    "inside" : "Created"
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=dateaz",
                            "inside" : SORT_AZ
                        })
                }) +
                Tag({
                    "tag"    : "TD",
                    "inside" :
                        Tag({
                            "tag"    : "A",
                            "href"   : "index.asp?"+getQueryString(p) + "&sort=dateza",
                            "inside" : SORT_ZA
                        })
                })
        })
});

var p = {
    "cmd"  : "list",
    "path" : path,
    "sort" : sort

};

var lnkCheck = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdSelectAll()",
    "inside" : CMD_CHECK
});
var lnkUncheck = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdSelectNone()",
    "inside" : CMD_UNCHECK
});
var lnkXCheck = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdSelectInvert()",
    "inside" : CMD_XCHECK
});

p["cmd"] = "aspinfo";
var lnkInfo = Tag({
    "tag"    : "A",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_INFO
});
p["cmd"] = "new";
var lnkNew = Tag({
    "tag"    : "A",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_NEW
});
var lnkView = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdView()",
    "inside" : CMD_VIEW
});
var lnkEdit = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdEdit()",
    "inside" : CMD_EDIT
});
var lnkCut = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdCut()",
    "inside" : CMD_CUT
});
var lnkCopy = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdCopy()",
    "inside" : CMD_COPY
});
var lnkPaste = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdPaste()",
    "inside" : CMD_PASTE
});
p["cmd"] = "clear";
var lnkClear = Tag({
    "tag"    : "A",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_CLEAR
});
var lnkRename = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdRename()",
    "inside" : CMD_RENAME
});
p["cmd"]  = "list";
var lnkRefresh = Tag({
    "tag"    : "A",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_REFRESH
});
var lnkAttr = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdAttr()",
    "inside" : CMD_ATTR
});
p["cmd"] = "newdir";
var lnkMkDir = Tag({
    "tag"    : "A",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_MKDIR
});
var lnkRemove = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdRemove()",
    "inside" : CMD_REMOVE
});
var lnkSend = Tag({
    "tag"    : "A",
    "href"   : "javascript:cmdSend()",
    "inside" : CMD_SEND
});
p["cmd"]  = "list";
p["path"] = STARTDIR;
var lnkHome = Tag({
    "tag"    : "A",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_HOME
});
p["cmd"] = "logout";
var lnkExit = Tag({
    "tag"    : "A",
    "target" : "_top",
    "href"   : "index.asp?" + getQueryString(p),
    "inside" : CMD_EXIT
});

var tblMenuPanel = Tag({
    "tag"         : "TABLE",
    "border"      : "0",
    "cellpadding" : "1",
    "cellspacing" : "1",
    "inside"      :
        Tag({
            "tag"    : "TR",
            "inside" :
                Tag({
                    "tag" : "TD",
                    "inside" : lnkCheck
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkUncheck
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkXCheck
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : ICO_SPACE
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkHome
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkRefresh
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : ICO_SPACE
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkNew
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkView
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkEdit
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkRename
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkAttr
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkSend
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : ICO_SPACE
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkMkDir
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkCut
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkCopy
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkPaste
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkClear
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : ICO_SPACE
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkRemove
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkInfo
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : ICO_SPACE
                }) + "\n" +
                Tag({
                    "tag" : "TD",
                    "inside" : lnkExit
                })
        })
});
%>