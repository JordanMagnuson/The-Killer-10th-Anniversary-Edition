USE_MULTIPLY_BLENDMODE = true;
DURATION = 10;
FADE_IN_DURATION = 10 ;
FADE_OUT_DURATION = 20;
MAX_ALPHA = 0.3;	
TEMPCOUNTER = 0;
sprite_index = sprSunset;
fadein = false;
fadeout = false;
image_alpha = 0;

function Sunset(){
	oMyWorldController.time = "sunset";
	depth = -999;
	//image_alpha = 0; //should be zero for fading in, temp set to MAX_ALPHA
	//blending is happening in the draw event
	oSoundController.startNight();
}

//show_debug_message("START SUNSET ");
alarm[0] = DURATION * room_speed;

function fadeIn(){
	fadein = true;	
}

fadeIn();

function fadeOut(){
	fadeout = true;	
}

function complete(){
	if (global.shotFired || global.exploded)
		return;	
	instance_create_depth(0,0,0, oNight);
	oNight.Night();
	fadeOut();
}

function destroy(){
	instance_destroy(self);	
}
	
	


