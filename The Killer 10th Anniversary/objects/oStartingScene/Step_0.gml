//destroy when off screen
if(x < (0 - sprite_width) && !offScreen){
	offScreen = true;
	offScreenAction();
}

//Item speed
if(oPlayer.walking){
	switch(distance){
		case "mid":
			//move mid distance objects exactly 1 pixel every other frame.
			if(oMyWorldController.oddFrame == 1){
				x -= global.rate * (global.WALKING_SPEED / 100);
			}
			break;
		case "close":
			//move mid distance objects exactly 1 pixel every other frame.
			x -= global.rate * (global.WALKING_SPEED / 100);
			break;
		case "far":
			//move mid distance objects exactly 1 pixel every other frame.
			if(oMyWorldController.thirdFrame == 1){
				x -= global.rate * (global.WALKING_SPEED / 100);
			}
			break;
	}
}