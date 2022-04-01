MIN_SPEED = 75;
MAX_SPEED = 150;

FADE_IN_DURATION = 0.5;
FADE_OUT_DURATION = 0.5;

MAX_Y = 132;

MAX_LIFE = 1.3;
MIN_LIFE = 0.5;

fadein = false;
fadeout = false;

function shootingStar(starDirection = 1){
	self.starDirection = starDirection;
	sprite_index = sprShootingStar;
	if(starDirection == 1){
		image_xscale = -1;	
	}
	depth = 499;
	image_alpha = 0;
	
	//Luminence
	maxAlpha = 0.6 + random(1) * 0.4
	
	// Starting Position
	x = -sprite_width + random(1) *(room_width + 2*sprite_width);
	y = random(1) * MAX_Y;
	
	//Speed
	starSpeed = MIN_SPEED + random(1) *(MAX_SPEED-MIN_SPEED);
	
	//Lifetime
	lifeDuration = MIN_LIFE + random(1) *(MAX_LIFE - MIN_LIFE);
	alarm[0] = lifeDuration * room_speed;
	
	fadeIn();
}

function fadeIn(){
	fadein = true;
}

function fadeOut(){
	fadeout = true;	
}

function destroy(){
	instance_destroy(self);	
}

