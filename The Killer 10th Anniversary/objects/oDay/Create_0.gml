/// @description Insert description here
// You can write your code in this editor
DURATION = 45;

function Day(world, changeSound = true){
	oMyWorldController.time = "day";
	alarm[0] = DURATION * room_speed;
	if(changeSound){
		oSoundController.startDay();	
	}
}

function complete(){
	instance_create_depth(0, 0, 0, oSunset);
	//show_debug_message("CREATED SUNSET IN DAY: "+ string(oSunset.image_alpha));
	oSunset.Sunset();
	instance_destroy(self);
}