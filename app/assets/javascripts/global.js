// Add class to buttons on mobile devices so they are always visible
var detectMobile = function() {
    if (/Mobi/.test(navigator.userAgent)) {
        $('button').addClass('touch');
    }
}

$(detectMobile);