event_inherited();
sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

creationNumber = 0;

DAY_SOUND = "sndForestAmbient";
NIGHT_SOUND = "sndForestNightAmbient";

Location(DAY_SOUND, NIGHT_SOUND);
locationType = "forest";

function createItemHere(){
	oLocation.createItem();
	
	creationNumber = random(1);
	
	//Mid distance
	if(random(1) > 0.2){
		if(creationNumber < 0.005 && global.oGiantPineSeen == false){
			instance_create_depth(room_width+10, 175,0, oGiantPine);
			global.oGiantPineSeen = true;
	 	}
		else if(creationNumber < 0.01){
			if(!instance_exists(oRiver))
				instance_create_depth(room_width+10, 175,0, oRiver);
		}
		else if(creationNumber < 0.05){
			instance_create_depth(room_width+10, 175,0, oPineTreeSideways);
		}
		else if(creationNumber < 1){
			instance_create_depth(room_width+10, 175,0, oPineTree);	
		}
	}
	//sounds
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.2 + 0.7 * random_range(0,1);
		// Night sounds
		if (oMyWorldController.time == "night"){
			if (creationNumber < 0.1 && !audio_is_playing(sndOwl)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndOwl, false, 20);
			}					
			else if (creationNumber < 0.2 && !audio_is_playing(sndWolf)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndWolf, false, 20);
			}	
			else if (creationNumber < 0.3 && !audio_is_playing(sndCreaking)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndCreaking, false, 20);
			}
			else if (creationNumber < 0.4 && !audio_is_playing(sndCicadas)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndCicadas, false, 20);
			}
		}
		// Day sounds
		else{
			if (creationNumber < 0.01 && !audio_is_playing(sndCicadas)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndCicadas, false, 20);
			}						
			else if (creationNumber < 0.02 && !audio_is_playing(sndOwl)){
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndOwl, false, 20);
			}
			else if (creationNumber < 0.03 && !audio_is_playing(sndWolf)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndWolf, false, 20);
			}
			else if (creationNumber < 0.15 && !audio_is_playing(sndCreaking)){
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndCreaking, false, 20);
			}
		}
	}
}

function gameStart(){
	instance_create_depth(150, 175, 0, oPineTree);	
}