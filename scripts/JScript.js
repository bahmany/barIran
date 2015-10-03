

var InternationalCounter = 10;
var PersonalInsuranceCounter = 8;

function limitText(limitField, limitCount, limitNum) {
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	} else {
		limitCount.value = limitNum - limitField.value.length;
	}
}








// These are for Null Cheker in Client Side
// First AddToNotNullValidator recieves those controls then  StartCheckNullValidator check them
// pay attention that it must be written with some embbeded code
var NotNullObjects = new Array();
var ErrorMessage = new Array();
function AddToNotNullValidator(ControlName,ErrorMessage,DefaultParam)
{
    var ar_str = [];
    ar_str[0]=ControlName;
    ar_str[1]=ErrorMessage;
    ar_str[2]=DefaultParam;
    NotNullObjects.push(ar_str);
}
function StartCheckNullValidator(DisableObject)
{
    if (DisableObject != "")
            {
                document.getElementById(DisableObject).disabled = false;


             //   document.getElementById(objectName).visibility = "visible";
            }

    for (var i=0;i<NotNullObjects.length;i++ )
    {
        var objectName = NotNullObjects[i][0];
        var ErrorMessage = NotNullObjects[i][1];
        var DefaultParam = NotNullObjects[i][2];

        if (document.getElementById(objectName).value == DefaultParam )
        {
            if (DisableObject != "")
            {
               document.getElementById(DisableObject).disabled = true;
               // document.getElementById(objectName).visibility = "visible";
            }
        document.getElementById(objectName).className = "NotNullControls";
           // ErrorMessage.push(ErrorMessage);
        } else
        {
           document.getElementById(objectName).className = "NotNullControlsOK";
        }
    }
}


// JScript File

function onlyNumbers(evt) {
    var e = evt
    if (window.event) { // IE
        var charCode = e.keyCode;
    } else if (e.which) { // Safari 4, Firefox 3.0.4
        var charCode = e.which
    }
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function onlyAlp(evt) {
    var e = evt
    if (window.event) { // IE
        var charCode = e.keyCode;
    } else if (e.which) { // Safari 4, Firefox 3.0.4
        var charCode = e.which
    }
    if (charCode < 58 && charCode > 48)
        return false;
    return true;
}







function textonly(e) {
    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var character = String.fromCharCode(code);
    //alert('Character was ' + character);
    //alert(code);
    //if (code == 8) return true;
    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    if (AllowRegex.test(character)) return true;
    return false;
}