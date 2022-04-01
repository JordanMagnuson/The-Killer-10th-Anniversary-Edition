FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;

text = "Don't let go.";
//font is already set
alpha = 0;
x = 145;
y = 100;
fade = false;
fadein = true;
function fadeOut(){
	fade = true;
}
function destroy(){
	alarm[0] = 2 * room_speed;	
}