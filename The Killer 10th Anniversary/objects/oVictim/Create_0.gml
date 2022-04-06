FADE_OUT_DURATION = 2;

WALK_DELAY_TIME = 1;
STOP_DELAY_TIME = 0.7;
STUMBLE_TIME = 0.2;
FAST_WALK_TIME = 3;
		
DEFAULT_WALKING_SPEED = 0.5;
WALK_FAST_SPEED = 0.6;
RUN_SPEED = 1.3;
walkingSpeed = DEFAULT_WALKING_SPEED;
		
DEFAULT_ANIM_SPEED = 10;
animSpeed = DEFAULT_ANIM_SPEED;
		
walking = false;
stumbling = false;
fastWalking = false;
kneeling = false;
runningAway = false;
	
fading = false;


function kneel()
{
	image_speed = 0;
	walking = false;
	fastWalking = false;
	kneeling = true;
}

function stop()
{
	image_speed = 0;
	// TODO: Stop Walking Sound
	walking = false;
	
	//kill stopping alarm
	alarm_set(1, -1);
}

function slowWalk()
{
	image_speed = 0;
	if(fastWalking)
	{
			show_debug_message("cooL");
		walking = true;
		fastWalking = false;
		
		//kill walking alarm
		alarm_set(0, -1);
	}
}

function fastWalk()
{
	image_speed = 0;
	//set fastwalk alarm
	alarm_set(3, FAST_WALK_TIME * room_speed);
	walking = false;
	fastWalking = true;
	
	//kill walking alarm
	alarm_set(0, -1);
}

function runAway()
{
	image_speed = 0;
	walking = false;
	fastWalking = false;
	runningAway = true;
	
	//kill walking alarm
	alarm_set(0, -1);			
}
		
function stumble()
{
	sprite_index = sprVictim;
	image_index = 0;
	image_speed = STUMBLE_TIME * room_speed;
	stumbling = true;
			
	var vol = 0.5 + 0.5 * random(1);
	//TODO: Play Walking Sound
}

function waitToFade()
{

//PORT TODO: This line is ready once global.victimStillRun has been set
/*
	//Set Wait to Fade Alarm
	alarm_set(4, global.victimStillRun.DISPLAY_EACH_DURATION * room_speed);
*/
}


//PORT TODO: Implement Fade Out

function fadeOut()
{
	/*
	fadeTween = new ColorTween(destroy);
	addTween(fadeTween);		
	fadeTween.tween(FADE_OUT_DURATION, Colors.WHITE, Colors.WHITE, 1, 0);	
	fading = true;
	*/
}


function setGraphics(_sprName)
{
	show_debug_message("Sprite Changed:" + _sprName);
	switch(_sprName)
	{
		case "stand":
			sprite_index = sprVictim;
			image_index = 0;
			image_speed = 0;
			break;
		case "stumble":
			sprite_index = sprVictim;
			image_index = 0;
			image_speed = 1/(animSpeed * room_speed);
			break;
		case "walk":
			sprite_index = sprVictimWalkingSheet;
			image_index = 0;
			image_speed = 1/(animSpeed * .8 * room_speed);
			break;
		case "fast_walk":
			sprite_index = sprVictimWalkingSheet;
			image_index = 0;
			image_speed = 1/(animSpeed * 1.2 * room_speed);
			break;
		case "run":
			sprite_index = sprVictimWalkingSheet;
			image_index = 0;
			image_speed = 1/(animSpeed * 1.4 * room_speed);
			break;
		case "kneel":
			sprite_index = sprVictimDying;
			image_index = 0;
			image_speed = 0;
			break;
		
		default:
			show_debug_message("Invalid Input: oVictim.setGraphics()");
			break;
	}
}

x = global.player.x + 10;
y = 155;