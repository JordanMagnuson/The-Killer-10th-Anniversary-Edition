walking = false;
MAX_TIME_TILL_KNEEL = 8;
MIN_TIME_TILL_KNEEL = 4;

sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

global.gun = instance_create_depth(x, y, depth, oGun);
global.crossHair = instance_create_depth(x, y, depth, oCrosshair);
alarm[0] = (MAX_TIME_TILL_KNEEL * random(1) + MIN_TIME_TILL_KNEEL) * room_speed;

function makeVictimKneel()
{
	if(!global.mercifulShot && instance_exists(global.victim))
		global.victim.kneel();
}

function makeVictimRun()
{
	global.victimStillRun = instance_create_depth(x, y, depth, oVictimStillRunController);
	global.victimStillRun.added();
	global.victim.fadeOut();

	// This falling camera alarm time is different from original source, I think because the camera y position starts out differently from original source.
	alarm[3] = 19.3*room_speed/global.rate; //start falling camera alarm
	//one whole minute before falling camera happens in source code
	fadeMusicIn(10);
	fadeItems(10/global.rate);
}

function fadeItems(duration = 10)
{
	oMyWorldController.fadeAllItemsGeneric(duration);
}

function playMusic()
{
	oMyWorldController.musicEnd();
}

function fadeMusicIn()
{
	oMyWorldController.fadeMusicIn(10);
}

function killVictim()
{
	global.deadVictim = instance_create_depth(x, y, depth, oDeadVictim);
	global.deadUnderground = instance_create_depth(x, y, depth, oDeadUnderground);
	global.deadVictim.x = global.victim.x + 12;//+12 makes up for origin configuration (victim dying has a differnt origin for the spinning sequence when falling)
	global.deadVictim.y = global.victim.y - 4;
	instance_destroy(global.victim);
}

function startFallingCamera()
{
	instance_create_depth(x, y, depth, oFallingCameraGuide);
}

function gameOver()
{
	if (global.GAME_OVER_ABOUT_CAMBODIA) {
		room_goto(rmGameOverOriginal);
	}
	else {
		room_goto(rmGameOver);
	}
}