if(keyboard_check_pressed(ord("M"))){
	show_debug_message("m pressed");
	releaseMeteorShower();
}
if(fadein == true)
	image_alpha += (1/FADE_IN_DURATION)/room_speed;
	
if(image_alpha >=1){
	fadein = false;
}
if(fadeout == true){
	if(image_alpha == 0)
		destroy();
	image_alpha -= (1/FADE_OUT_DURATION)/room_speed;
}
