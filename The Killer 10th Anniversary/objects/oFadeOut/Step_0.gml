if(fade){
	if(image_alpha < 1){
		image_alpha += 	(1/_time)/room_speed;
	}
	else{
		startBuffer();
	}
}