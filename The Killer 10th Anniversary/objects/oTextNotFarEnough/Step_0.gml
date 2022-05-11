if(oPlayer.walking && started == false && !fadein){ //this removes the item at the beginning of the game looking at started varuabke
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
else if(!fade and oPlayer.walking and alarm[0] == -1){
	alarm[0] = 2 * room_speed; //this line makes the text fade from the screen after the player begins walking again
}	

if(fade){
	if(alpha <= 0){
		destroy();
	}
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}