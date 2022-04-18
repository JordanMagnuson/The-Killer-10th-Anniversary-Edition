//fading function currently ignores the "ease.quadIn section
// ease.quadIn returns _t*_t
// _t is used in the update of ColorTween.as to alter the rgb values of the color
//the color here is just black so we might be able to get away with just altering the speed of the fade
if(_bufferComplete){	
	if(image_alpha > 0){
		image_alpha -= 	(1/_time)/room_speed;
	}
	else{
		destroy();
	}
}