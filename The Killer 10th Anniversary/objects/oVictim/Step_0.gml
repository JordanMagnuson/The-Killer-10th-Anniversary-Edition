if(sprite_index == sprVictim and image_index >= 9)
{
	stumbling = false;
	fastWalk();
}


if(!walking)
{
	walkingSpeed = DEFAULT_WALKING_SPEED;
}

if(stumbling)
{
	setGraphics("stumble");
	x += 0.2
}
else if(walking)
{
	setGraphics("walk");
	
	walkingSpeed -= .0001;
	if(global.player.walking)
	{
		x -= (DEFAULT_WALKING_SPEED - walkingSpeed);
	}
	else
	{
		x += walkingSpeed;
		//If not already set, set stopping alarm
		if(alarm_get(1) <= 0)
		{
			alarm_set(1, STOP_DELAY_TIME * room_speed);
			show_debug_message(alarm_get(1));
		}
	}
}
else if(fastWalking)
{
	setGraphics("fast_walk");
	
	if(global.player.walking)
	{
		x += WALK_FAST_SPEED - DEFAULT_WALKING_SPEED;
	}
	else
	{
		slowWalk();
	}
}
else if(runningAway)
{
	setGraphics("run");
	x += RUN_SPEED;
}
else if(kneeling)
{
	setGraphics("kneel");
	image_index = 0;
}
else
{
	setGraphics("stand");
	image_index = 0;
	if(global.player.walking)
	{
		if(oMyWorldController.oddFrame == 1)
			x -= .5;
		//If not already set, set walking alarm
		if(alarm_get(0) <= 0 and (x - global.player.x <= 30))
		{
			alarm_set(0, WALK_DELAY_TIME * random(1) * room_speed);
		}
	}
}

show_debug_message(image_speed)