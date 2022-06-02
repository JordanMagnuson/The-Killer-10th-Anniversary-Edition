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
started = false;
day = "";
night = "";
function soundController(location){
	self.location = location;
	day = asset_get_index(oLocation.daySound);
	night = asset_get_index(oLocation.nightSound);
	if(oMyWorldController.time == "day"){
		currentSound = day
	}	
	else{
		currentSound = night;
	}
	
	// Safety check for HTML5, where audio may not always be available.
	if (audio_system_is_available() && audio_sound_is_playable(currentSound))
		audio_play_sound_on(soundEmitter00, currentSound, true, 100);
	else
		alarm[1] = 10;	// If audio system not available, try again in 10 frames.
}

function fadeOut(duration = 15){
	if(inProcess)
		return;
	global.fadeSounds = true;
	global.playSounds = false;
	alarm[0] = duration * room_speed; //when the fading is complete, call fadeComplete();
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

function changeLocation(location = "jungle"){
	if(!global.playSounds || global.fadeSounds)
		return;
	
	switch(oMyWorldController.currentLocation.locationType){ 
			case "beach":
				day = sndWavesAmbient;
				night = sndWavesAmbient;
				break;
			case "forest":
				day = sndForestAmbient;
				night = sndForestNightAmbient;
				break;
			case "jungle":
				day = sndJungleDay;
				night = sndJungleNight;
				break;
			case "plains":
				day = sndForestAmbient;
				night = sndForestNightAmbient;
				break;
			default:
				show_debug_message("Sound selection failed");
	}
	
	if(inProcess){
		show_debug_message("in process");
	}
	else{
		if(oMyWorldController.time == "day"){
			newSound = day;
		}
		else{
			newSound = night
		}
		audio_emitter_gain(soundEmitter01, currentGain01);
		audio_play_sound_on(soundEmitter01, newSound, 1, 100); //play the new sound
		currentSound = newSound;
		inProcess = true;
	}
}

function fadeComplete(){
	inProcess = false;
	audio_emitter_free(soundEmitter00);//stop the previous sound after it has finished fading
	soundEmitter00 = audio_emitter_create(); //recreate the emitter
	
	//reset the currentGain
	currentGain00 = currentGain01;
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
	
	if(oMyWorldController.time == "day" && currentSound != day){
		show_debug_message("catching up with day");
		startDay();	
	}
	else if (oMyWorldController.time != "day" && currentSound != night){
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
		newSound = night;
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
		newSound = day;
		audio_emitter_gain(soundEmitter01, currentGain01);
		audio_play_sound_on(soundEmitter01, newSound, 1, 100); //play the new sound
		currentSound = newSound;
		inProcess = true;
	}	
}