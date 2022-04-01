FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;

started = false;

text = "Walk or Die";
//font is already set
x = 145;
y = 100;
alpha = 0;
fadein = false;
fadeout = false;

function fadeIn(){
	fadein = true;
}

fadeIn();
alarm[0] = 5 * room_speed;


function fadeOut(){
	oTextJordan.fadeOut();
	fadeout = true;
}
function destroy(){
	instance_destroy(self);	
}