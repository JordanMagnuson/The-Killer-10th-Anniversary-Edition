
DISPLAY_EACH_DURATION = 6;
TIME_BETWEEN_EACH = 7;
DISTANCE_BETWEEN_EACH = 45;

imageIndex = 1;

function added()
{
	var v = instance_create_depth(x, y, depth, oVictimStillRun);
	v.displayTime = DISPLAY_EACH_DURATION;
	v.image_index = imageIndex;
	v.added();
}

function showNext()
{
	x += DISTANCE_BETWEEN_EACH;
	imageIndex += 1;
	if(imageIndex == 4)
		imageIndex = 0;
	
	var v = instance_create_depth(x, y, depth, oVictimStillRun);
	v.displayTime = DISPLAY_EACH_DURATION;
	v.image_index = imageIndex;
	v.added();
	
	alarm_set(0, TIME_BETWEEN_EACH * room_speed);
}

alarm_set(0, TIME_BETWEEN_EACH * room_speed);