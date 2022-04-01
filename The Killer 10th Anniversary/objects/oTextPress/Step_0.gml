if(instance_exists(oPlayer)){
	if(oPlayer.walking && started == false){
		started = true;
		alpha = 1;
		alarm[0] = 2 * room_speed;
	}
}
if(fade == true){
	if(alpha == 0)
		destroy();
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}