var gbWidth, gbHeight;
var aspectRatio = {
    width: 4,
    height: 3
}

$(window).load(function () {
    setBody();
    setScreen();
    setupCam();
});

// $(function () {
    
// });

var setBody = function () {
    var gbBody = $('#gb-body');
    gbWidth = gbBody.width();
    gbHeight = $(window).height() - (gbWidth / 1.66);
    gbBody.css('width', gbWidth);
    gbBody.css('height', gbHeight);
}

var setScreen = function () {
    var gbScreen = $('#gb-screen');
    var gbScreenWidth = gbWidth - (40);
    var gbScreenHeight = aspectHeight(gbScreenWidth);
    
    gbScreen.css('width', gbScreenWidth);
    gbScreen.css('height', gbScreenHeight);
}

var setupCam = function () {
    var video = $('#videoElement');
    video.css('width', $('#gb-screen').width());
    video.css('height', $('#gb-screen').height());

    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia || navigator.oGetUserMedia;

    if (navigator.getUserMedia) {
        navigator.getUserMedia({ video: true }, handleVideo, videoError);
    }

    function handleVideo(stream) {
        video.attr('src',window.URL.createObjectURL(stream));
    }

    function videoError(e) {
        // do something
    }
}

var aspectHeight = function(width){
    return width / (aspectRatio.width/aspectRatio.height);
}