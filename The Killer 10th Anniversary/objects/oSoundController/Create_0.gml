FADE_DURATION = 10;
inProcess = false;
soundsStopped = false;
fadingOut = false;

newSound = asset_get_index(oLocation.daySound); //set to base value
soundEmitter00 = audio_emitter_create();
soundEmitter01 = audio_emitter_create();
currentGain00 = 1; //gain for soundEmitter00
currentGain01 = 0; //gain for soundEmitter01
fadeOnOne = false;
fadeOnTwo = false;
location = "";
currentSound = "";

function soundController(location){
	self.location = location;
	if(oMyWorldController.time == "day"){
		currentSound = asset_get_index(oLocation.daySound);
		show_debug_message("Day sound set");
	}	
	else{
		currentSound = asset_get_index(oLocation.nightSound);
	}
	audio_play_sound_on(soundEmitter00, currentSound, true, 100);
	
}

function fadeOut(duration = 15){
	if(inProcess)
		return;
	global.fadeSounds = true;
	global.playSounds = false;
	alarm[0] = duration; //when the fading is complete, call fadeComplete();
	self.duration = duration;
	fadingOut = true;
}

function stopSounds(){	
	if(global.fadeSounds){
		fadingOut = true;
		if(inProcess){
			duration = 0.01;
			alarm[0] = duration;
		}
		audio_stop_sound(newSound);
		audio_stop_sound(currentSound);
		soundsStopped = true;
			
	}	
}

function changeLocation(location){
	if(!global.playSounds || global.fadeSounds)
		return;
	//if(!inProcess){
		if(oMyWorldController.time == "day"){
			newSound =  asset_get_index(oLocation.daySound);	
		}
		else{
			newSound = asset_get_index(oLocation.nightSound);
		}
		show_debug_message("new sound is playing: " + oLocation.daySound);
		audio_emitter_gain(soundEmitter01, currentGain01);
		audio_play_sound_on(soundEmitter01, newSound, 1, 100); //play the new sound
		currentSound = newSound;
		inProcess = true;
	//}
}

function fadeComplete(){
	inProcess = false;
	audio_emitter_free(soundEmitter00);//stop the previous sound after it has finished fading
	soundEmitter00 = audio_emitter_create(); //recreate the emitter
	
	//reset the currentGain
	currentGain00 = 1;
	currentGain01 = 0;
	
	//change the sound to play on soundEmitter00 rather than soundEmitter01
	var tempSound = soundEmitter00;
	soundEmitter00 = soundEmitter01;
	soundEmitter01 = tempSound;
	
	//reset soundEmitter01
	audio_emitter_free(soundEmitter01);
	soundEmitter01 = audio_emitter_create();
	audio_emitter_gain(soundEmitter01, currentGain01);
	
	if(fadingOut){
		fadingOut = false;
		global.fadeSounds = false;
	}
	
	if(global.fadeSounds && !fadingOut){
		fadeOut();	
	}
	
	if(global.fadeSounds){
		return;	
	}
	
	if(!global.playSounds){
		stopSounds();	
	}
	
	if(oMyWorldController.time == "day" && currentSound != asset_get_index(oLocation.daySound)){
		show_debug_message("catching up with day");
		startDay();	
	}
	else if (oMyWorldController.time != "day" && currentSound !=asset_get_index(oLocation.nightSound)){
		show_debug_message("catching up with night");
		startNight();
	}
	else{
		show_debug_message("no need to catch up");	
	}
}

function startNight(){
	
	if(!global.playSounds || global.fadeSounds)
		return;
		
	show_debug_message("start night");
	if(inProcess == true){
		show_debug_message("in process");
		//show_debug_message("current sound vol: " + currentSound.volume);
		//show_debug_message("new sound vol: " + newSound.volume);
	}
	else{
		newSound =  asset_get_index(oLocation.nightSound);
		audio_emitter_gain(soundEmitter01, currentGain01);
		audio_play_sound_on(soundEmitter01, newSound, 1, 100); //play the new sound
		currentSound = newSound;
		inProcess = true;
	}	
}

function startDay(){
	if(!global.playSounds || global.fadeSounds)
		return;
	show_debug_message("start day");
	if(inProcess == true){
		show_debug_message("in process");
		//show_debug_message("current sound vol: " + currentSound.volume);
		//show_debug_message("new sound vol: " + newSound.volume);
	}
	else{
		newSound =  asset_get_index(oLocation.daySound);
		audio_emitter_gain(soundEmitter01, currentGain01);
		audio_play_sound_on(soundEmitter01, newSound, 1, 100); //play the new sound
		currentSound = newSound;
		inProcess = true;
	}	
}