
if(fadein == true){
	image_alpha += (1/FADE_IN_DURATION)/room_speed;
	//show_debug_message("Night FADEIN: " + string(image_alpha));
}
	
if(image_alpha >= MAX_ALPHA){
	fadein = false;
}


if(fadeout == true){
	if(image_alpha == 0)
		destroy();
	image_alpha -= (1/FADE_OUT_DURATION)/room_speed;
	//show_debug_message("Night FADEOUT: " + string(image_alpha));
}
