
switch(fadeStatus)
{
	case 0:
		break;
	case 1:
		alpha = 1 - (alarm_get(0)/(FADE_IN_DURATION * room_speed));
		break;
	case 2:
		alpha = 1;
		break;
	case 3:
		alpha = alarm_get(2)/(FADE_OUT_DURATION * room_speed);
		break;
	default:
		show_debug_message("Invalid Fade Status: oVictimStillRun.Step");
		break;
}

image_alpha = alpha;