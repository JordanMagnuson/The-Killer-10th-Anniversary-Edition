if(x > -(sprite_get_width(sprGroundBeach)/2)){
	if(instance_exists(oPlayer) && oPlayer.walking){
		if (global.smooth_scrolling) {
			x -= (global.WALKING_SPEED/50);
		}
		else if(oMyWorldController.fourthFrame == 1){
			x -= (global.WALKING_SPEED/50);
		}
	}
}
else if(currentLocation == oMyWorldController.location){
	if(variable_instance_exists(oMyWorldController, "oldGround")){
		//this is getting called infinitely after the oldground is initially deleted
		instance_destroy(oMyWorldController.oldGround); 
	}
}

if(currentLocation != oMyWorldController.location){
	depth = 13;
}