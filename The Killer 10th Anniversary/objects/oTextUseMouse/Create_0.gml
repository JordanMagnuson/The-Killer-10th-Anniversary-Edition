FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;

text = "Use the Mouse to Aim.";
//font is already set
alpha = 0;
x = 20;
y = 137;
fade = false;
fadein = true;
function fadeOut(){
	fade = true;
}
function destroy(){
	alarm[0] = 2 * room_speed;	
}