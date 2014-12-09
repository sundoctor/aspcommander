<SCRIPT LANGUAGE="JavaScript">
<!--

function cmdGoBack() {
    var newurl = "<!--$url-->";
    document.location.href = newurl;
}

var block = false;
function checkForm(form) {
    if (block) return false;
    var errMessage = "";
    if (form.elements['filename'].value.length<1)
        errMessage = "Wrong dir name!";
    if (errMessage == '') {
        block = true;
        return true;
    }
    alert(errMessage);
    return false;
}

//-->
</SCRIPT>
