if(!global.shotFired)
	image_angle = point_direction(x, y, mouse_x, mouse_y);

//moved gun placement code from create to step to prevent crash
if(global.playerShooting and x == 0)
{
	x = global.playerShooting.x + 7;
	y = global.playerShooting.y - 8;
}
