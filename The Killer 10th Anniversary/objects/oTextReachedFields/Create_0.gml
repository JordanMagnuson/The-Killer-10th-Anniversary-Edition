FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;

text = "You have reached the fields.";
//font is already set
alpha = 0;
x = 20;
y = 120;
fade = false;
fadein = true;

function fadeOut(){
	fade = true;
}

function destroy(){
	alarm[0] = 2 * room_speed;	
}