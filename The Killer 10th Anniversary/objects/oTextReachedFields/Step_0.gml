if(fadein == true)
{
	if(global.shotFired)
		return;
	alpha += (1/FADE_IN_DURATION)/room_speed;
}
	
if(alpha >=1){
	fadeOut();
	fadein = false;
	if(instance_exists(oTextPress))
		oTextPress.fadeOut(); 
}
if(fade == true){
	if(alpha == 0)
		destroy();
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}