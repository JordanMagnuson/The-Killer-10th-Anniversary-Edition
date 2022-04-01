FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;

text = "Jordan Magnuson presents:";
//font is already set
alpha = 0;
x = 20;
y = 100;
alarm[0] = 2 * room_speed;

fadein = false;
fadeout = false;

function fadeIn(){
	fadein = true;
}

fadeIn();

function nextText(){
	instance_create_depth(0,0,0, oTextWalkOrDie);	
}

function fadeOut(){
	fadeout = true;	
}

function destroy(){
	instance_destroy(self);	
}
