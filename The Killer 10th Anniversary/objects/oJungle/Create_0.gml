event_inherited();
sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

DAY_SOUND = "sndJungleDay";
NIGHT_SOUND = "sndJungleNight";

Location(DAY_SOUND, NIGHT_SOUND, 0.6, 0.4);
locationType = "jungle";

if(!global.startedWalking){
	instance_create_depth(0,0,0, oStartingScene);
}

function createItemHere(){
	oLocation.createItem();
	
	creationNumber = random(1);
	
	if(random(1) > 0.05){
		if(creationNumber < 0.1){
			instance_create_depth(room_width+10, 175,0, oJungleTree);
		}
		else if(creationNumber < 0.5){
			instance_create_depth(room_width+10, 175,0, oBush);
		}
		else if(creationNumber < 1){
			instance_create_depth(room_width+10, 175,0, oPalm);
		}
	}
	
	//Sounds
	if (random(1) > 0.6 && global.playSounds){
		pan = choose( -1, 1) * random(1);
		vol = 0.2 + 0.7 * random(1);
		// Night sounds
		if (oMyWorldController.time != "day"){
			if (creationNumber < 0.01 && !audio_is_playing(sndMonkey)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndMonkey, false, 20);
			}					
			else if (creationNumber < 0.05 && !audio_is_playing(sndCicadas)){
				audio_emitter_gain(sEmit1, 2);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndCicadas, false, 20);
			}	/*
			else if (creationNumber < 0.1 && !audio_is_playing(sndKookaburra)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndKookaburra, false, 20);
			}*/
			else if (creationNumber < 0.1 && !audio_is_playing(sndMacaw)){
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndMacaw, false, 20);
			}
		}
		// Day sounds
		else{
			if (creationNumber < 0.01 && !audio_is_playing(sndMonkey)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndMonkey, false, 20);
			}						
			else if (creationNumber < 0.1 && !audio_is_playing(sndKookaburra)){
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndKookaburra, false, 20);
			}
			else if (creationNumber < 0.15 && !audio_is_playing(sndMacaw)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndMacaw, false, 20);
			}
			else if (creationNumber < 0.3 && !audio_is_playing(sndLittleParrot)){
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndLittleParrot, false, 20);
			}
		}
	}
}	

function gameStart(){
	//instance_create_depth(0, 0, 0, oStartingScene);
}