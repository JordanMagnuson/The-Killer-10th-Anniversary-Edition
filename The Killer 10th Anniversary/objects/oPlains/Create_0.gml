event_inherited();
DAY_SOUND = "sndForestAmbient";
NIGHT_SOUND = "sndForestNightAmbient";
SND_BEE = sndBee;
SND_CICADAS = sndCicadas;

sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

Location(DAY_SOUND, NIGHT_SOUND, 3, 0.3);
locationType = "plains";

function createItemHere()
{
	oLocation.createItem();
	creationNumber = random_range(0,1);
		
	if (random_range(0,1) > 0.25) {		
		if (creationNumber < 0.005 && global.oFlowerTreeSeen == false){
			instance_create_depth(room_width+10, 175, 0, oFlowerTree);
			global.oFlowerTreeSeen = true;
			//show_debug_message(string(creationNumber) + ": Flower Tree Created");
		}
		else if (creationNumber < 0.03){
			instance_create_depth(room_width+10, 175, 0, oRiver);
			//show_debug_message(string(creationNumber) + ": River Created");
		}
		else if (creationNumber < 0.1){
			instance_create_depth(room_width+10, 175, 0, oTree);
			//show_debug_message(string(creationNumber) + ": Tree Created");
		}
		else if (creationNumber < 1){
			instance_create_depth(room_width+10, 175, 0, oFlowers);
			//show_debug_message(string(creationNumber) + ": oFlower Created");
		}
	}	
		
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.2 + 0.7 * random_range(0,1);
		
		//Night Sounds
		if(oMyWorldController.time == "night"){
			if(creationNumber < 0.01 && !audio_is_playing(sndBee)){
				sPlainEmit0 = audio_emitter_create();
				audio_emitter_gain(sPlainEmit0, vol);
				audio_emitter_position(sPlainEmit0, pan, 0, 0);
				audio_play_sound_on(sPlainEmit0, sndBee, false, 20);
			}
			else if(creationNumber < 0.06 && !audio_is_playing(sndCicadas)){
				sPlainEmit1 = audio_emitter_create();
				audio_emitter_gain(sPlainEmit1, vol);
				audio_emitter_position(sPlainEmit1, pan, 0, 0);
				audio_play_sound_on(sPlainEmit1, sndCicadas, false, 20);
			}
		}
		//Day Sounds
		else{
			if(creationNumber < 0.01 && !audio_is_playing(sndCicadas)){
				sPlainEmit2 = audio_emitter_create();
				audio_emitter_gain(sPlainEmit2, vol);
				audio_emitter_position(sPlainEmit2, pan, 0, 0);
				audio_play_sound_on(sPlainEmit2, sndCicadas, false, 20);
			}
			else if(creationNumber < 0.06 && !audio_is_playing(sndBee)){
				sPlainEmit3 = audio_emitter_create();
				audio_emitter_gain(sPlainEmit3, vol);
				audio_emitter_position(sPlainEmit3, pan, 0, 0);
				audio_play_sound_on(sPlainEmit3, sndBee, false, 20);
			}
		}
	}

}

function gameStart(){
	instance_create_depth(150, 175, 0, oFlowers); 
}