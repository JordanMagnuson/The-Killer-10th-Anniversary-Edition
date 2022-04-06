if (fadeInCalled and image_alpha < 1){
	image_alpha += (1/FADE_IN_DURATION)/room_speed;	
	oWaterCover.image_alpha = image_alpha;
}
else if(image_alpha >= 1){
	fadeInCalled = false;
}

if (fadeOutCalled and image_alpha > 0){
	image_alpha -= (1/FADE_OUT_DURATION)/room_speed;
	if(image_alpha <= 0){
		instance_destroy(self);
		instance_destroy(oWaterCover);
	}
}

// Move waves
x += waveDirection * SPEED * delta_time/1000000; //delta_time/1000000 is from google doc (FP.elasped equivalent)
			
// Change direction
if (waveDirection == -1 && x < X_INIT)
	{
		waveDirection = 1;
	}
	else if (waveDirection == 1 && x > X_INIT + 8){
		waveDirection = -1;
	}
