// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var shiftNumber = 5;

function DoLogin()
{
    document.loginForm.password.value = caesarShift(document.loginForm.password.value, shiftNumber);
    return true;
}

function caesarShift(text, shift)
{
    var result = "";

    for(var i = 0; i < text.length; ++i)
    {
        var c = text.charCodeAt(i);
        if (c >= 65 && c <= 90)
        {
            result += String.fromCharCode((c - 65 + shift) % 26 + 65);
        }
        else if(c >= 97 && c <= 122)
        {
            result += String.fromCharCode((c - 97 + shift) % 26 + 97);
        }
        else
        {
            result += String.fromCharCode(c + shift);
        }
    }

    return result;
}
