if(fadein){
	if (image_alpha < 1){
		image_alpha += (1/FADE_IN_DURATION)/room_speed;
		show_debug_message("image_alpha of ctc: " + string(image_alpha));
	}
	else{
		fadein = false;	
	}
}

if(image_alpha >= 0.5){
	window_set_cursor(cr_handpoint); // show mouse cursor
}

if(mouse_check_button_released(mb_any)){
	switch(global.endScreen){
		case 0:
			global.endScreen++;
			instance_destroy(oEndScreen1);//clear the old screen
			instance_create_depth(0,0,0, oFadeIn);
			oFadeIn.FadeIn(oColors.BLACK, 6);
			instance_create_depth(0,0,0,oEndScreen02);
			window_set_cursor(cr_none); // hide mouse cursor
			show_debug_message("End of case 0. endScreen++: " + string(global.endScreen));
			instance_destroy(self);
			break;
		case 1:
			instance_destroy(oEndScreen02);//clear the old screen
			instance_create_depth(0,0,0, oFadeIn);
			oFadeIn.FadeIn(oColors.BLACK, 6);
			instance_create_depth(0,0,0,oEndScreen03);
			window_set_cursor(cr_none); // hide mouse cursor
			instance_destroy(self);
			break;
	}
}