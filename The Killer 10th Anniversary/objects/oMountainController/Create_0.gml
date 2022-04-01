MAX_MOUNTAIN_RELEASE_TIME= 20;
MIN_MOUNTAIN_RELEASE_TIME = 0.5;
MOUNTAIN_DENSITY_CHANGE_RATE = 0.5;
MOUNTAIN_DENSITY_CHANGE_TIME = 5;

mountainReleaseTime = 1;
mountainDensitySlope = 0;

mountainReleaseTime = (MIN_MOUNTAIN_RELEASE_TIME + random(1)*(MAX_MOUNTAIN_RELEASE_TIME-MIN_MOUNTAIN_RELEASE_TIME));
mountainDensitySlope = choose(-1, 1);

alarm[0] = mountainReleaseTime*room_speed;//mountain alarm

alarm[1] = MOUNTAIN_DENSITY_CHANGE_TIME * room_speed; //mountain density alarm

function releaseMountain(){
	alarm[0] = mountainReleaseTime * room_speed;
	instance_create_depth(room_width+10, 175,0, oMountain);
}

function changeMountainDensity(){
	alarm[1] = MOUNTAIN_DENSITY_CHANGE_TIME * room_speed;	
	switch (mountainDensitySlope){
		case 1:
			if (mountainReleaseTime > MIN_MOUNTAIN_RELEASE_TIME){
				mountainReleaseTime -= MOUNTAIN_DENSITY_CHANGE_RATE;
			}
			if(mountainReleaseTime < MIN_MOUNTAIN_RELEASE_TIME*3){
				if(random(1) > 0.8){
					mountainDensitySlope = -1;	
				}
			}
			break;
		case -1: 
		default:
			if(mountainReleaseTime < MAX_MOUNTAIN_RELEASE_TIME){
				mountainReleaseTime += MOUNTAIN_DENSITY_CHANGE_RATE;	
			}
			if(mountainReleaseTime > MAX_MOUNTAIN_RELEASE_TIME * 0.6){
				if (random(1) > 0.8){
					mountainDensitySlope = 1;
				}
			}
			break;
			
		if (mountainReleaseTime < MIN_MOUNTAIN_RELEASE_TIME){
			mountainReleaseTime = MIN_MOUNTAIN_RELEASE_TIME;
		}
		else if (mountainReleaseTime > MAX_MOUNTAIN_RELEASE_TIME){
			mountainReleaseTime = MAX_MOUNTAIN_RELEASE_TIME;
		}
	}
}