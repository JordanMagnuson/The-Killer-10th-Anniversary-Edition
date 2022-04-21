BLACK = $FF000000;

_fadeComplete = false;
_goto = "";
_buffer = 0;
fade = false;

function FadeOut(goto, color = BLACK, time = 3, buffer = 0){
	_goto = goto;
	_buffer = buffer;
	
	//create a rectangle the size of the screen
	draw_rectangle(0, 0, room_width, room_height, _color);
	depth = -1000;
	image_alpha = 0;
	
	//start the fading
	fade = true;
}

function startBuffer(){
	if(_buffer > 0){
	alarm[0] = buffer;	
	}
	else{
		switchWorlds();	
	}
}

function switchWorlds(){
	room_goto(rmGameOver);
}