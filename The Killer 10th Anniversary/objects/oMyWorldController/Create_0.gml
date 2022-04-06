CHANGE_LOCATION_TIME = 4;

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;

location = "";
lastLocation = "";
nextLocation = "";

time = "";

music = sndMusicJonsiTornado;
musicEnd = sndJonsiTornadoEnd;
musicStarted = false;
musicEmit = audio_emitter_create();

room_height = 200
room_width = 300;
room_speed = 30;

currentLocation = instance_create_depth(0, 0, 0, oForest);
locationName = currentLocation.locationType; 
alarm[0] = CHANGE_LOCATION_TIME;

// Sound Controller
instance_create_depth(0,0,0, oSoundController);

// Ground and Sky
ground = instance_create_depth(0,175,12, oGround);
oGround.x = -sprite_get_width(sprGroundBeach)/2;

instance_create_depth(0, 0, 0, oSky);
oSky.Sky();
	
//Mountain controller
instance_create_depth(0,0,0, oMountainController);

//Night-Day cycle
instance_create_depth(0,0,0, oNight);
oNight.Night();
time = "night";

// Time Counter
global.timeCounter = instance_create_depth(0,0,0, oTimeCounter);

//Player
global.player = instance_create_depth(0, 0, -1, oPlayer);
global.victim = instance_create_depth(0,0, -1, oVictim);

//Starting Text
alarm[1] = 3 * room_speed;

//---------------------------------------------------------------
// Use audio listener to handle pan and fade for positional sounds.
// This is different from original AS3 source code.
// See tutorial at https://www.youtube.com/watch?v=ZpPBlD9FyKw
audio_listener_orientation(0,1,0,0,0,1);			// Fix left-right orientation.
audio_listener_position(global.player.x, global.player.y-10,0);	// Position listener at player location. (There seems to be a bug in HTML5 compiler, where y position of listener needs to be slightly different from emitter(s), or else sound jumps from left to right speaker.)
//---------------------------------------------------------------

//---------------------------------------------------------------
// Use camera object to handle window resizing, fullscreen, etc.
// This is different from original AS3 source code.
instance_create_depth(0,0, -1, oCamera);
//---------------------------------------------------------------

oLocation.creationTime = 0.6;
oLocation.gameStart();
oLocation.alarm[0] = 6; // 6 frames = 0.1 seconds 

if(global.shouldExplode){
	global.explosionTime = global.EARLIEST_EXPLOSION + random(1) * (global.LATEST_EXPLOSION - global.EARLIEST_EXPLOSION);
	alarm[3] = global.explosionTime * room_speed;
	show_debug_message("explosion set to: " + string(global.explosionTime));
}
else{
	show_debug_message("no explosion this time");	
}

window_set_cursor(cr_none); // hide mouse cursor
show_debug_message("Time in jungle: " + string(global.timeInJungle));
show_debug_message("Time in forest: " + string(global.timeInForest));
show_debug_message("Time in beach: " + string(global.timeInBeach));


function explode(){
	if(global.player.walking){
		alarm[3] = 1 * room_speed;
		return;
	}
	global.rate = 0.4 
	global.exploded = true;
	//instance_create_depth(0,0,0, oExplosion);
	//instance_create_depth(0,0,0, oExplodedPlayer);
	//instance_create_depth(0,0,0, oExplodedVictim);
	instance_destroy(oPlayer);
	//instance_destroy(oVictim);
	
	audio_stop_sound(music);
	global.playSounds = false;
	alarm[4] = 6 * room_speed; 
	//global.deadUnderground = instance_create_depth(0,0,0, oDeadUnderground);
}

function startFallingCamera(){
	//instance_create_depth(0,0,0, oFallingCamera);	
}

function fadeMusicIn(duration = 10){
	show_debug_message("Music fading in");
	musicStarted = true;
	//oSoundController.fadeout(duration); IMPLEMENT AFTER FADEOUT FUNCTION HAS BEEN ADDED
	global.playSounds = false;
	global.fadeSounds = true;
	//music.loop(0); AGAIN, NOT SURE HOW TO CONVERT THIS
	//musicFader.fadeTo(1, duration); OR THIS 
}

function musicFaderComplete(){
	show_debug_message("music fader complete");
	global.fadeSounds = false;
}

function fadeAllItemsAfterExplosion(){
	audio_play_sound_on(musicEmit, music, false, 100);
	musicStarted = true;
	//musicFade.fadeTo(1,10); // NOT SURE HOW TO CONVERT
	alarm[5] = 13* room_speed;
	/*	oItem NOT YET CREATED
	for (var i = 0; i < instance_number(oItem); ++i;){
		if(instance_find(oItem, i).type != cloud){
			instance_find(oItem,i).fadeOutImage(10);
		}
	}
	*/
}

function fadeAllItemsGeneric(duration = 10){//THIS MAY NOT WORK
/*	oItem NOT YET CREATED
	for (var i = 0; i < instance_number(oItem); ++i;){
		if(instance_find(oItem, i).type != cloud){
			instance_find(oItem,i).fadeOutImage(duration);
		}
	}
	*/
}

function fadeItem(){ //THIS MAY NOT WORK
	show_debug_message("Fade item");
	itemList = ds_list_create()
	/*	oItem NOT YET CREATED
	for (var i = 0; i < instance_number(oItem); ++i;){
		ds_list_add(itemList, instance_find(oItem,i));
	}
	*/
	if(itemList){
		ds_list_shuffle(itemList);
		do{
			if(itemList[0]){
				var e = ds_list_find_value(itemList,0);
				ds_list_delete(itemList, 0);
			}
			else
				break;
		}until (e.type == "cloud")
		//e.fadeOutImage(3);
		alarm[4] = 3 * room_speed;
	}
}

function changeLocation(location = ""){
	show_debug_message("Change Location");
	show_debug_message("Location changes: " + global.locationChanges);
	show_debug_message("time since last location: " + oTimeCounter.timePassedSinceLastLocationChange);
	oTimeCounter.timePassedSinceLastLocationChange = 0;
	
	switch(global.locationChanges){
		case 0:
			newLocation = instance_create_depth(0,0,0,oForest); 
			break;
		case 1:
			newLocation = instance_create_depth(0,0,0,oBeach);	
			break;
		case 2:
			global.touchedPlains = true;
			alarm[2] = 15 * room_speed;
			show_debug_message("Reached plains alarm set");
			newLocation = instance_create_depth(0,0,0, oPlains);
			break;
	}
	
	if(newLocation = ""){
		do{
		newLocation = choose("jungle", "forest", "plains", "beach");	
		}until (newLocation != self.location.type);
	}
	if(oSoundController)
		oSoundController.changeLocation(newLocation);
	instance_destroy(self.location);

	/*If(newLocation == "jungle")
		instance_create_depth(0,0,0, oJungle);	UNCOMMENT WHEN OJUNGLE IS CREATED
	else*/ if (newLocation == "forest")
		instance_create_depth(0,0,0, oForest);
	else if (newLocation == "plains")
		instance_create_depth(0,0,0, oPlains);
	else if (newLocation == "forest")
		instance_create_depth(0,0,0, oBeach);	
	oLocation.Location();    
	oLocation.creationTime = 2;
	oLocation.alarm[0] = 6; // 6 frames = 0.1 seconds

	//destroys old ground when change location is spammed
	if(variable_instance_exists(oMyWorldController, "oldGround")){ 
		if(instance_exists(oldGround)){
			instance_destroy(oldGround);
		}
	}
	oldGround = ground;
	ground = instance_create_depth(room_width, oGround.y, 12, oGround);	
	global.locationChanges++;
}

function reachedPlains(){
	show_debug_message("reached plains");
	//if (oPlayer.walking)
		//instance_create_depth(0,0,0,oTextReachedFields); UNCOMMENT WHEN OTEXTREACHEDFIELDS HAS BEEN FINISHED
	global.reachedPlains = true;
}

function changeLocationChance(){
	alarm[0] = CHANGE_LOCATION_TIME;
	
	if(global.locationChanges == 0 && oTimeCounter.timePassedSinceLastLocationChange < global.timeInJungle){
		return;	
	}
	else if(global.locationChanges == 1 && oTimeCounter.timePassedSinceLastLocationChange < global.timeInForest){
		return;
	}	
	else if(global.locationChanges == 2 && oTimeCounter.timePassedSinceLastLocationChange < global.timeInBeach){
		return;	
	}

	switch(location.creationTimeSlope){
		case 1:
			if (location.creationTime < (location.minCreationTime * 2)){
				if (random(1) > 0.6){
					location.creationTimeSlope = 0;
				}
			}
			break;
		case 0:
			if (random(1) > 0.6){
				location.creationTimeSlope = -1;
			}
			break;
		case -1:
			if (location.creationTime > (location.maxCreationTime * 0.75)){
				if (random(1) > 0.6){
					changeLocation();
				}		
			}
			break;
	}
}

function advanceTime(){
	switch (time){
		case "day":
			instance_create_depth(0, 0, 999, oSunset)
			oSunset.Sunset();
			//oDay.complete();
			break;
		case "sunset":
			instance_create_depth(0, 0, 999, oNight)
			oNight.Night();
			//oSunset.complete();
			break;
		case "night":
			instance_create_depth(0, 0, 999 , oDay);
			oDay.Day(self);
			//oNight.complete();
			break;
	}
}

function showTextPress(){
	//if(!global.startedWalking)
		//instance_create_depth(0,0,0, oTextPress) UNCOMMENT WHEN OTEXTPRESS IS CREATED
}

function showTitle(){
	//instance_create_depth(0,0,0, oTextJordan);	UNCOMMENT WHEN OTEXTJORDAN IS CREATED
}