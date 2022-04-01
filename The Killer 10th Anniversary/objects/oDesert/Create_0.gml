event_inherited();
Location("sndSilence", "sndSilence", 5 ,2);
locationType = "desert";
creationTimeSlope = 1;
sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

function createItemHere(){
	oLocation.createItem();
	//show_debug_message("AFTER DESERT CREATE ITEM");
	creationNumber = random(1);
	
	//Mid distance
	if(random(1) > 0.25){
		if(creationNumber < 0.01 && global.oPyramidsSeen == false){
			instance_create_depth(room_width+10, 175,0, oPyramids);
			//show_debug_message("Pyramid Created");
			global.oPyramidsSeen = true;
	 	}
		else if(creationNumber < 0.05){
			instance_create_depth(room_width+10, 175,0, oGiantCactus);
			//show_debug_message("Giant Cactus Created");
		}
		else if(creationNumber < 0.1){
			instance_create_depth(room_width+10, 175,0, oButte);
			//show_debug_message("Butte Created");
		}
		else if(creationNumber < 0.15){
			instance_create_depth(room_width+10, 175,0, oTumbleweed);	
			//show_debug_message("TumbleWeed Created");
		}
		else if(creationNumber < 1){
			instance_create_depth(room_width+10, 175, 0, oCactus);
			//show_debug_message("Cactus Created");
		}
		//show_debug_message("Creation Number (oDesert CreateItemHere): " + string(creationNumber));  
	}
	//sounds
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.2 + 0.7 * random_range(0,1);
		// Night sounds
		if (oMyWorldController.time == "night"){
			if (creationNumber < 0.1 && !audio_is_playing(sndWolf)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndWolf, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends		
			}					
			else if (creationNumber < 0.5 && !audio_is_playing(sndWind)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndWind, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}		
		}
		// Day sounds
		else{
			if (creationNumber < 0.5 && !audio_is_playing(sndWolf)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndWolf, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}						
			else if (creationNumber < 0.5 && !audio_is_playing(sndWind)){
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndWind, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}					
		}
	}
}

function gameStart(){
	instance_create_depth(150, 175, 0, oCactus);
}