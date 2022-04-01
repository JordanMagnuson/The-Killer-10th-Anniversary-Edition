event_inherited();
creationTimeSlope = 1;
locationType = "snow";

sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

DAY_SOUND = "sndWindAmbient";
NIGHT_SOUND = "sndWindAmbient";
Location(DAY_SOUND,NIGHT_SOUND, 5, 0.5);

//Controls item creation for this location
function createItemHere(){
	oLocation.createItem();
	
	creationNumber = random_range(0,1);
	if (random_range(0,1) > 0.25){		
		if (creationNumber < 0.01 && global.oSnowmanSeen == false){ 
			instance_create_depth(room_width+10, 175, 0, oSnowman);
			global.oSnowmanSeen = true;
			//show_debug_message(string(creationNumber) + ": SnowMan Created");
		}
		else if (creationNumber < 0.05){
			instance_create_depth(room_width+10, 175, 0, oIgloo);
			//show_debug_message(string(creationNumber) + ": Frozen River Created");
		}
		else if (creationNumber < 0.09){
			instance_create_depth(room_width+10, 175, 0, oFrozenRiver);
			//show_debug_message(string(creationNumber) + ": Igloo Created");
		}
		else if (creationNumber < 0.3){
			instance_create_depth(room_width+10, 175, 0, oBarrenTree);
			//show_debug_message(string(creationNumber) + ": Barren TreeCreated");
		}
		else if (creationNumber < 1){
			instance_create_depth(room_width+10, 175, 0, oSnowDrift);
			//show_debug_message(string(creationNumber) + ": Snow Drift Created");
		}
	}
	//show_debug_message("Creation Number (oBeach CreateItemHere): " + string(creationNumber));      
}


function gameStart(){
	instance_create_depth(150, 175, 0, oSnowDrift); 
}