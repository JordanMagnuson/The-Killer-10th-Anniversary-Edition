BLACK = $FF000000;

_color = "";
_time = 0;
_bufferComplete = false;

function FadeIn(color = BLACK, time = 3, buffer = 0){
	_color = color;	
	_time = time;
	
	//create a rectangle the size of the screen
	//done in draw step
	depth = -1000;
	image_alpha = 1;
	//start the buffer alarm
	if(buffer > 0){
		alarm[0] = buffer;	
	}
	else{
		startFade();	
	}
}

function startFade(){
	_bufferComplete = true;
}

function destroy(){
	if(global.endScreen < 2){
		show_debug_message("click to continue created");
		instance_create_depth(0,0,0, oClickToContinue);	
	}
	instance_destroy(self);
}