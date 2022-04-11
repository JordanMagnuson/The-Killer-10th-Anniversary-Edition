if(image_xscale == -1){
	if(x < (0 + sprite_width)){
	//show_debug_message("object destroyed, went offscreen, x = " + string(x));
	offScreenAction();
	}
}
else if(x < (0 - sprite_width)){
	//show_debug_message("object destroyed, went offscreen, x = " + string(x));
	offScreenAction();
}
				
if(instance_exists(oPlayer) && oPlayer.walking){
	switch(distance){
		case "mid": 
			//move mid distance objects exactly 1 pixel every other frame.
			if (global.smooth_scrolling) {
				x -= (global.WALKING_SPEED/100)/2;
			}
			else if(oMyWorldController.oddFrame ==1){
				x -= global.WALKING_SPEED/100;
			}
			break;
		case "close":
			//move close distance objects exatly 1 pixel every frame.
			x -= global.WALKING_SPEED/100;
			break; 
		case "far":
			//move far distance objects exactly 1 pixel every third frame
			if (global.smooth_scrolling) {
				x -= (global.WALKING_SPEED/100)/3;
			}			
			else if(oMyWorldController.thirdFrame == 1){
				x -= global.WALKING_SPEED/100;
			}
			break;
	}
}

if(fading and image_alpha > 0){
	image_alpha -= (1/duration)/room_speed;	
}
if(image_alpha <= 0 and canDestroy){
		instance_destroy();
}
