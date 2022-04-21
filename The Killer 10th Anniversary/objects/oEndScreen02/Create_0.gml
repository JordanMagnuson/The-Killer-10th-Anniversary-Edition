FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;

fadeIn();

function fadeIn()
{
	alarm_set(0, FADE_IN_DURATION * room_speed);
}