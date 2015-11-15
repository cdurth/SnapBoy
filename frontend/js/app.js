var picFlag = false;

$(function () {

    $("#snap").click(function () {
        console.log('snap');
    });

    $("#send").click(function () {
        console.log('send');
    });

});

// Put event listeners into place
window.addEventListener("DOMContentLoaded", function () {
	// Grab elements, create settings, etc.
	var canvas = document.getElementById("imgCanvas"),
		context = canvas.getContext("2d"),
		video = document.getElementById("videoElement"),
		videoObj = { "video": true },
		errBack = function (error) {
			console.log("Video capture error: ", error.code);
		};
	//video.style.width = $('#gb-screen').width();
	//video.style.height = $('#gb-screen').height();
	// Put video listeners into place
	if (navigator.getUserMedia) { // Standard
		navigator.getUserMedia(videoObj, function (stream) {
			video.src = stream;
			video.play();
		}, errBack);
	} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
		navigator.webkitGetUserMedia(videoObj, function (stream) {
			video.src = window.webkitURL.createObjectURL(stream);
			video.play();
		}, errBack);
	}
	else if (navigator.mozGetUserMedia) { // Firefox-prefixed
		navigator.mozGetUserMedia(videoObj, function (stream) {
			video.src = window.URL.createObjectURL(stream);
			video.play();
		}, errBack);
	}
	
	// Trigger photo take
document.getElementById("snap").addEventListener("click", function() {
	picFlag = true;
	document.getElementById("videoElement").style.display = "none";
	context.drawImage(video, 0, 0, 160, 120);
});

	// Trigger send
document.getElementById("send").addEventListener("click", function() {
	if(picFlag){
		var img = convertCanvasToImage(canvas);
		// myPost("http://localhost:3000/api/app", {uri:img}, function(res){
		// 	alert('SUCCESS! Picture is being processed and sent to print queue');
		// 	window.location.reload(true);
		// });
		
		$.post( "http://localhost:3000/api/app", {uri:img}, function( data ) {
		  	alert('SUCCESS! Picture is being processed and sent to print queue');
			window.location.reload(true);
		});
		
		// var xhttp = new XMLHttpRequest();
	    // xhttp.open("GET", "http://localhost:3000/api/app", false);
		// xhttp.send(img);
		
	} else {
		alert('Please take a picture first!');
	}
});


	// Trigger reset
document.getElementById("reset").addEventListener("click", function() {
	window.location.reload(true);
});
}, false);

// Converts canvas to an image
function convertCanvasToImage(canvas) {
    var image = new Image();
    image.src = canvas.toDataURL("image/png");
    return image.src;
}

function getXmlDoc() {
  var xmlDoc;

  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlDoc = new XMLHttpRequest();
  }
  else {
    // code for IE6, IE5
    xmlDoc = new ActiveXObject("Microsoft.XMLHTTP");
  }

  return xmlDoc;
}

function myPost(url, data, callback) {
  var xmlDoc = getXmlDoc();

  xmlDoc.open('POST', url, true);
  xmlDoc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  xmlDoc.onreadystatechange = function() {
	  console.log(xmlDoc.readyState,xmlDoc.satus,xmlDoc.responseText);
    if (xmlDoc.readyState === 4 && xmlDoc.status === 200) {
		console.log('after')
      callback(xmlDoc);
    }
  }

  xmlDoc.send(data);
}