FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;
fade = false;
text = "Hold space to start walking.";
draw_set_font(fntFont);

x = 20;
y = 100;
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