FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;

if (global.is_touch_device == 1) 
	text = "Touch screen where you wish to shoot.";
else if (global.is_touch_device == 0)
	text = "Use the Mouse to Aim.";
else
	text = "Aim and shoot.";

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