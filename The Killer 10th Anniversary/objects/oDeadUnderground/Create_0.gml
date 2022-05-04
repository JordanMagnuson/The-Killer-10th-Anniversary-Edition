x = 0;
y = 175;
depth = -999;

switch(oMyWorldController.location)
{
	case "beach":
		image_blend = oColors.BEACH_YELLOW;
		break;
	case "desert":
		image_blend = oColors.DESERT_ORANGE;
		break;
	case "forest":
		image_blend = oColors.FOREST_BROWN;
		break;
	case "plains":
		image_blend = oColors.PLAINS_GREEN;
		break;
	case "snow":
		image_blend = oColors.SNOW_WHITE;
		break;
}
