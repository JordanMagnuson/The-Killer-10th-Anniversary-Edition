image_speed = animSpeed;

if(oPlayer.x > x)
	x += 1;

if(fading)
	image_alpha = alarm_get(5)/(FADE_OUT_DURATION * room_speed);

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
	x += 0.2;
}
else if(walking)
{
	setGraphics("walk");
	
	walkingSpeed -= .0001;
	if(oPlayer.walking)
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
		}
	}
}
else if(fastWalking)
{
	setGraphics("fast_walk");
	
	if(oPlayer.walking)
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
	image_speed = 0;
	if(oPlayer.walking)
	{
		if(oMyWorldController.oddFrame == 1)
			x -= 1; //changed from .5 to 1 in order to correct graphical bug
			
		//If not already set, set walking alarm
		if(alarm_get(0) <= 0 and (x - global.player.x <= 30))
		{
			alarm_set(0, WALK_DELAY_TIME * random(1) * room_speed);
		}
	}
}

if(rate != global.rate){
	rate = global.rate;
	FADE_OUT_DURATION = 2/global.rate;
}