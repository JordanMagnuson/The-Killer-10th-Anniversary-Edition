BLACK = $FF000000;

_color = "";
_time = 0;
_bufferComplete = false;

function FadeIn(color = BLACK, time = 3, buffer = 0){
	_color = color;	
	_time = time;
	
	//create a rectangle the size of the screen
	draw_rectangle(0, 0, room_width, room_height, _color);
	depth = -1000;
	
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
		instance_create_depth(0,0,0, oClickToContinue);	
	}
	instance_destroy(self);
}