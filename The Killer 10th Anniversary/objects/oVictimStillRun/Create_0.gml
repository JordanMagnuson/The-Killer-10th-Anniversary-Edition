shouldFadeIn = true;
FADE_IN_DURATION = 2;
FADE_OUT_DURATION = 2;

displayTime = .5;

image_speed = 0;
alpha = 1;

fadeStatus = 0;

function added()
{
	if(shouldFadeIn)
	{
		fadeIn()
	}
	else
	{
		stayIn();
	}
}

function fadeIn()
{
	alarm_set(0, FADE_IN_DURATION * room_speed);
	fadeStatus = 1;
}

function stayIn()
{
	alarm_set(1, displayTime * room_speed);
	fadeStatus = 2;
}

function fadeOut()
{
	alarm_set(2, FADE_OUT_DURATION * room_speed);
	fadeStatus = 3;
}