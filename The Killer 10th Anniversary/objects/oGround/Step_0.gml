if(x > -(sprite_get_width(sprGroundBeach)/2)){
	if(instance_exists(oPlayer) && oPlayer.walking){
		if (global.smooth_scrolling) {
			x -= (oPlayer.SPEED/50)/4;
		}
		else if(oMyWorldController.fourthFrame == 1){
			x -= (oPlayer.SPEED/50);
		}
	}
}
else if(currentLocation == oMyWorldController.locationName){
	if(variable_instance_exists(oMyWorldController, "oldGround")){
		//this is getting called infinitely after the oldground is initially deleted
		instance_destroy(oMyWorldController.oldGround); 
	}
}

if(currentLocation != oMyWorldController.locationName){
	depth = 13;
}