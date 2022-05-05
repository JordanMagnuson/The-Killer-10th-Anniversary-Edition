if(fadein){
	if (alpha < 1){
		alpha += (1/FADE_IN_DURATION)/room_speed;	
	}
	else{
		fadein = false;	
	}
}

if(alpha >= 0.5){
	window_set_cursor(cr_default); // show mouse cursor
}

if(mouse_check_button_released(mb_any)){
	switch(global.endScreen++){
		case 0:
			instance_create_depth(0,0,0, oFadeIn);
			instance_create_depth(0,0,0,oEndScreen02);
			instance_destroy(self);
			break;
		case 1:
			instance_create_depth(0,0,0, oFadeIn);
			instance_create_depth(0,0,0,oEndScreen03);
			instance_destroy(self);
			break;
	}
}