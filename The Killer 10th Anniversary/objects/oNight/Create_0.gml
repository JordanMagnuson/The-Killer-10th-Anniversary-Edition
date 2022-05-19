USE_MULTIPLY_BLENDMODE = true;
DURATION = 30;
FADE_IN_DURATION = 6;
FADE_OUT_DURATION = 10;
MAX_ALPHA = 0.7;
shouldFadeIn = false;
fadein = false;
sprite_index = sprNightCover;
image_alpha = 0;
function Night(shouldFadeIn = true){
	self.shouldFadeIn = shouldFadeIn;
	oMyWorldController.time = "night";
	depth = -999
		
	if(shouldFadeIn){
		fadeIn();	
		image_alpha = 0;
	}
	else{
		instance_create_depth(0,0,0, oStars);
		oStars.stars(false);
		show_debug_message("stars created 1");
		image_alpha = MAX_ALPHA;
	}

}

fadeout = false;

alarm[0] = DURATION *room_speed;

function fadeIn(){
	fadein = true;	
	instance_create_depth(0,0,0, oStars);
	oStars.stars();
	show_debug_message("stars created 2");
}

function fadeOut(){
	fadeout = true;
	oStars.fadeOut();
}

function complete(){
	if (global.shotFired || global.exploded)
		return;
	instance_create_depth(0,0,0, oDay);
	oDay.Day(oMyWorldController);
	fadeOut();
	//destroy();//TEMPORARILY ADDED WHILE FADING IS OFF
}

function destroy(){
	instance_destroy(self);	
}


