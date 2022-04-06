event_inherited();
DAY_SOUND = "sndForestAmbient";
NIGHT_SOUND = "sndForestNightAmbient";

sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

Location(DAY_SOUND, NIGHT_SOUND, 3, 0.3);
locationType = "plains";

function createItemHere()
{
	oLocation.createItem();
	creationNumber = random(1);
		
	if (random(1) > 0.25) {		
		/*if (creationNumber < 0.005 && global.oFlowerTreeSeen == false){
			instance_create_depth(room_width+10, 175, 0, oFlowerTree);
			global.oFlowerTreeSeen = true;
		}
		else*/ if (creationNumber < 0.03){
			instance_create_depth(room_width+10, 175, 0, oRiver);
		}
		else if (creationNumber < 0.1){
			instance_create_depth(room_width+10, 175, 0, oTree);
		}
		else if (creationNumber < 0.2){
			instance_create_depth(room_width+10, 175, 0, oPlainsPalm);
		}
		else if (creationNumber < 1){
			instance_create_depth(room_width+10, 175, 0, oFlowers);
		}
	}	
		
	if (random(1) > 0.4 && global.playSounds){
		pan = choose( -1, 1) * random(1);
		vol = 0.2 + 0.7 * random(1);
		
		//Night Sounds
		if(oMyWorldController.time == "night"){
			if(creationNumber < 0.01 && !audio_is_playing(sndBee)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan, 0, 0);
				audio_play_sound_on(sEmit0, sndBee, false, 20);
			}
			else if(creationNumber < 0.06 && !audio_is_playing(sndCicadas)){
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan, 0, 0);
				audio_play_sound_on(sEmit1, sndCicadas, false, 20);
			}
		}
		//Day Sounds
		else{
			if(creationNumber < 0.01 && !audio_is_playing(sndCicadas)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan, 0, 0);
				audio_play_sound_on(sEmit2, sndCicadas, false, 20);
			}
			else if(creationNumber < 0.06 && !audio_is_playing(sndBee)){
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan, 0, 0);
				audio_play_sound_on(sEmit3, sndBee, false, 20);
			}
		}
	}

}

function gameStart(){
	instance_create_depth(150, 175, 0, oFlowers); 
}