//event_inherited();
if (global.smooth_scrolling) {
	x -= cloud_speed/4;	
}
else if(oMyWorldController.fourthFrame == 4)
{
	integer_pixel += cloud_speed;
	if (integer_pixel >= 1) {
		x -= 1;	
		integer_pixel = 0;
	}
}
if(image_xscale == -1){
	if(x < (0 + sprite_width)){
	instance_destroy(self); 
	}
}
else if (x < (0 - sprite_width))
{
	instance_destroy(self); 
	//show_debug_message("CLOUD GONE");
}

//if the global rate has changed since the cloud was created, change the cloud speed according to the global.rate
if(rate != global.rate){
	rate = global.rate;
	cloud_speed *= global.rate;
}

// Stop time when shot is fired.
if (global.shotFired || global.exploded) {
	cloud_speed = 0;
}