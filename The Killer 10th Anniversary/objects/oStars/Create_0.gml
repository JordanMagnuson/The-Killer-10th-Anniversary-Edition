randomize();

startedFadeOut = false;
releasedMeteorShower = false;
meteorShowerSeen = false;

SHOOTING_STAR_FREQ = oNight.DURATION / 3 + 1;
METEOR_SHOWER_FREQ = oNight.FADE_IN_DURATION - 5;

FADE_IN_DURATION = 6;
FADE_OUT_DURATION = 10;
sprite_index = sprStars;

image_alpha = 0;


shouldFadeIn = false;

function stars(shouldFadeIn = true){
	self.shouldFadeIn = shouldFadeIn;
	depth = 500;
	if(shouldFadeIn){
		image_alpha = 0;	
		fadeIn();
	}
	else{
		image_alpha = 1;	
	}
}
fadein = false;
fadeout = false;


function fadeIn(){
	fadein = true;	
}

alarm[0] = SHOOTING_STAR_FREQ * room_speed;
alarm[1] = METEOR_SHOWER_FREQ * room_speed;

function releaseShootingStar(){
	alarm[0] = SHOOTING_STAR_FREQ * room_speed;
	if(!startedFadeOut){
		starDirection = choose(-1,1)
		if(random(1) < 0.15){
			instance_create_depth(0,0,0,oShootingStar);
			oShootingStar.shootingStar(starDirection);
			show_debug_message("released shooting star"); 
		}
	}
}

function releaseMeteorShower(){
	show_debug_message("release meteor shower chance");
	show_debug_message("releaseMeteorShower random: " + string(random(1)));
	if(!meteorShowerSeen){
		if(random(1) < 0.1){
			meteorShowerSeen= true;
			instance_create_depth(0,0,0, oMeteorShower);
		}
	}
}

function fadeOut(){
	fadeout = true;	
}

function destroy(){
	instance_destroy(self);
}



