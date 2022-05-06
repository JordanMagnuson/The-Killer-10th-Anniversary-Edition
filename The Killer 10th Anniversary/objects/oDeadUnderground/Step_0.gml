switch(oMyWorldController.location)
{
	case "beach":
		image_blend = oColors.BEACH_YELLOW;
		show_debug_message("BEACH");
		break;
	case "desert":
		image_blend = oColors.DESERT_ORANGE;
		show_debug_message("ORANGE");
		break;
	case "forest":
		image_blend = oColors.FOREST_BROWN;
		show_debug_message("FOREST");
		break;
	case "plains":
		image_blend = oColors.PLAINS_GREEN;
		show_debug_message("PLAINS");
		break;
	case "snow":
		image_blend = oColors.SNOW_WHITE;
		show_debug_message("SNOW");
		break;
}