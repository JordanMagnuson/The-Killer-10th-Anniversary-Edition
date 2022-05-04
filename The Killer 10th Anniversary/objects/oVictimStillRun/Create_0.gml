shouldFadeIn = true;
FADE_IN_DURATION = 2;
FADE_OUT_DURATION = 2;

displayTime = 0.5;

image_speed = 0;
alpha = 1;

fadeStatus = 0;
//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

function added()
{
	if(shouldFadeIn)
	{
		fadeIn();
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