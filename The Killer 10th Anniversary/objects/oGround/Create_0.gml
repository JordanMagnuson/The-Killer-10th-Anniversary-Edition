y = 175;
currentLocation = oMyWorldController.locationName;
switch (oMyWorldController.locationName){
	case "forest":
		sprite_index = sprGroundForest;
		break;
	case "desert":
		sprite_index = sprGroundDesert
		break;
	case "snow":
		sprite_index = sprGroundSnow;
		break;
	case "plains":
		sprite_index = sprGroundPlains;
		break;		
	case "beach":
		sprite_index = sprGroundBeach;
		break;							
}
			
// Hit box			
sprite_set_offset(sprite_index, 0,0);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, 0, bboxkind_rectangular,0);
	
// Starting location
x = room_width;
y = oGround.y;
			
//depth = 12; //I'm going to set the depth in oMyWorldController so the oldground always goes
//behind the new ground