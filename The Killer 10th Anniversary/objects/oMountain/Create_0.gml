event_inherited();

switch(oLocation.locationType){
	case "forest":
		sprite_index = choose(sprMountainForest01, sprMountainForest02);
		break;
	case "desert":
		sprite_index = choose(sprMountainDesert01, sprMountainDesert02);
		break;
	case "snow":
		sprite_index = choose(sprMountainSnow01, sprMountainSnow02);
		break;
	case "plains":
		sprite_index = choose(sprMountainPlains01, sprMountainPlains01);
		break;
	case "beach":
		sprite_index = choose(sprMountainBeach01, sprMountainBeach02);
	default:
		sprite_index = choose(sprMountainForest01, sprMountainForest02);
}
type = "mountain";
Item(sprite_index, "far", true);
