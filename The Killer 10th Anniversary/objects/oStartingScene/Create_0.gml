sprite_index = sprStartingScene;

distance = "";

/**
* Movement. 
* These variables are used so that items never travel less than one pixel
* per frame, which keeps slow-moving items in sync. 
* See http://flashpunk.net/forums/index.php?topic=672.0
*/
moveDist = 0;
moveCounter = 0;		
offScreen = false;		

type = oStartingScene;
distance = "mid";

switch(distance){
	case "close":
		depth = random_range(-100, -101);
		break;
	case "mid":
		depth = random_range(10, 11);
		break;
	case "far":
		depth = random_range(100,101);
		break;
}

function offScreenAction(){
	destroy();
}
		
function destroy(){
	instance_destroy(self);
}	