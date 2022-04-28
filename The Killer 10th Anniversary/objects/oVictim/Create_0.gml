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
	walking = false;
	fastWalking = false;
	kneeling = true;
}

function stop()
{
	if(audio_is_playing(sndWalking))
	{
		audio_stop_sound(sndWalking);
	}
	walking = false;
	
	//kill stopping alarm
	alarm_set(1, -1);
}

function slowWalk()
{
	if(fastWalking)
	{
		walking = true;
		fastWalking = false;
		
		//kill walking alarm
		alarm_set(0, -1);
	}
}

function fastWalk()
{
	//set fastwalk alarm
	alarm_set(3, FAST_WALK_TIME * room_speed);
	walking = false;
	fastWalking = true;
	
	//kill walking alarm
	alarm_set(0, -1);
}

function runAway()
{
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
	audio_play_sound(sndWalking, 999, true); 
}

function waitToFade()
{
	//Set Wait to Fade Alarm
	alarm_set(4, global.victimStillRun.DISPLAY_EACH_DURATION * room_speed);
}

function fadeOut()
{
	alarm_set(5, FADE_OUT_DURATION * room_speed);
	fading = true;
}


function setGraphics(_sprName)
{
	//show_debug_message("Sprite Changed:" + _sprName);
	switch(_sprName)
	{
		case "stand":
			sprite_index = sprVictim;
			break;
		case "stumble":
			sprite_index = sprVictim;
			break;
		case "walk":
			sprite_index = sprVictimWalkingSheet;
			break;
		case "fast_walk":
			sprite_index = sprVictimWalkingSheet;
			break;
		case "run":
			sprite_index = sprVictimWalkingSheet;
			break;
		case "kneel":
			sprite_index = sprVictimDying;
			break;
		
		default:
			show_debug_message("Invalid Input: oVictim.setGraphics()");
			break;
	}
}

x = global.player.x + 10;
y = 155;