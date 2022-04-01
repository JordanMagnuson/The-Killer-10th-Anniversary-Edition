//only play the dying animation once
if(image_speed > 0){
	if(image_index > image_number-1){
		image_speed = 0;
		fade = true;
	}
}
if (fade and image_alpha > 0){
	image_alpha -= (1/FADE_OUT_DURATION)/room_speed;	
}
if(image_alpha == 0){
		instance_destroy();
}