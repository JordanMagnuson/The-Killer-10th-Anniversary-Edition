walking = false;
MAX_TIME_TILL_KNEEL = 8;
MIN_TIME_TILL_KNEEL = 4;

sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

global.gun = instance_create_depth(x, y, depth, oGun);
global.crossHair = instance_create_depth(x, y, depth, oCrosshair);


function makeVictimKneel()
{
	if(!global.mercifulShot)
		global.victim.kneel();
}

function makeVictimRun()
{
	global.victimStillRun = instance_create_depth(x, y, depth, oVictimStillRunController);
	//PORT TODO: implement victim.fadeout()
	//global.victim.fadeOut();
	
	//PORT TODO: Play oMyWorldController.music
	fadeItems();
}

function fadeItems()
{
	oMyWorldController.fadeAllItemsGeneric(10);
}

function playMusic()
{
	//PORT TODO: play oMyWorldController.musicEnd
}

function fadeMusicIn()
{
	oMyWorldController.fadeMusicIn(10);
}

function killVictim()
{
	global.deadVictim = instance_create_depth(x, y, depth, oDeadVictim);
	global.deadUnderground = instance_create_depth(x, y, depth, oDeadUnderground);
	global.deadVictim.x = global.victim.x;
	global.deadVictim.y = global.victim.y;
	instance_destroy(global.victim);
}

function startFallingCamera()
{
	instance_create_depth(x, y, depth, oFallingCameraGuide);
}

function gameOver()
{
	room_goto_next();
}