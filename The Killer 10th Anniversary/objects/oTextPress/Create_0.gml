FADE_OUT_DURATION = 3;
started = false;
fade = false;
text = "Hold space to start walking.";
draw_set_font(fntFont);

x = 20;
y = 100;
alpha = 1;


function nextText(){
	instance_create_depth(0, 0, 0, oTextLetGo);
}

function fadeOut(){
	fade = true;
}

function destroy(){
	instance_destroy(oTextPress);
}