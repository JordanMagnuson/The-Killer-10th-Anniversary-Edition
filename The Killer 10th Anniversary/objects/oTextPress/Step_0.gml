if(oPlayer.walking && started == false){
		started = true;
		alarm[0] = 2 * room_speed;
}

if(fadein){
	if(alpha < 1){
		alpha += (1/FADE_IN_DURATION)/room_speed;	
	}
	else{
		fadein = false;	
	}
}

if(fade){
	if(alpha <= 0){
		destroy();
	}
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}