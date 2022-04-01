x += starDirection*starSpeed *delta_time/1000000;

if(fadein == true)
	image_alpha += (1/FADE_IN_DURATION)/room_speed;
	
if(image_alpha >= maxAlpha){
	fadein = false;
}
if(fadeout == true){
	if(image_alpha <= 0)
		destroy();
	image_alpha -= (1/FADE_OUT_DURATION)/room_speed;
}