FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;
fade = false;
if (global.is_touch_device == 1) 
	text = "Touch screen to start walking.";
else if (global.is_touch_device == 0)
	text = "Hold space to start walking.";
else
	text = "Hold space or touch screen to start walking."
draw_set_font(fntFont);

x = 20;
y = 127;
alpha = 0;


function nextText(){
	instance_create_depth(0, 0, 0, oTextLetGo);
}

fadein = true;

function fadeOut(){
	fade = true;
}

function destroy(){
	instance_destroy(oTextPress);
}