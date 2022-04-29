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
else if(alarm[0] < 0){
	alarm[0] = 2 * room_speed; //this line makes the text fade from the screen after the player begins walking again
}	

if(fade){
	if(alpha <= 0){
		destroy();
	}
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}