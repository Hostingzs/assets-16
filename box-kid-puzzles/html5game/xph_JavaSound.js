function javasound_play(file) {	
	// first of all delete the audio element if already exists	
	var audio = document.getElementById("gameMusic");	
	if (audio)	{		
		audio.parentNode.removeChild(audio);	
	}		
	// create a new audio element	
	audio = document.createElement("audio");	
	audio.setAttribute("id", "gameMusic");	
	audio.setAttribute("loop", "true");		
	var mp3 = document.createElement("source");	
	mp3.setAttribute("src", "html5game/" + file + ".mp3");	
	mp3.setAttribute("type", "audio/mpeg");	
	audio.appendChild(mp3);		
	var ogg = document.createElement("source");	
	ogg.setAttribute("src", "html5game/" + file + ".ogg");	
	ogg.setAttribute("type", "audio/ogg");	
	audio.appendChild(ogg);		
	audio.play();
	document.body.appendChild(audio);
	return audio;
}

function javasound_volume(audio,myVolume) {
	if(audio) {
		audio.volume = myVolume;
	}
}

function javasound_pause(audio) {
	if(audio) {
		audio.pause();
	}
}

function javasound_resume(audio) {
	if(audio) {
		audio.play();
	}
}

function javasound_stop(audio) {
	if(audio) {
		audio.pause();
		audio.parentNode.removeChild(audio);	
	}
}

var javasound_musicBool = true;
function javasound_enableMusic(value) {
	javasound_musicBool = value;
}

function javasound_isPaused(audio) {
	if(audio) {
		return audio.paused;
	}
	return true;
}

function javasound_exists(audio) {
	if (audio)	{		
		if(audio.getAttribute("id") == "gameMusic")
			return true
	}
	return false;
}

window.addEventListener("blur", function(_) {
	var audio = document.getElementById("gameMusic");
	if(audio) {
		//if(!audio.paused) {
			audio.pause();
		//}
	}
});
window.addEventListener("focus", function(_) {
	var audio = document.getElementById("gameMusic");
	if(audio) {
		//if(audio.paused) {
		if(javasound_musicBool)
			audio.play();
		//}
	}
});