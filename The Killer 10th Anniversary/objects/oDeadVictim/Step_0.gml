image_angle -= 1 *global.rate;

if (image_index < 3) {
	if (global.rate < 0.4) 
		image_speed = 1*global.rate/0.4;
	else 
		image_speed = 1;
}
else {
	image_speed = 0;
}



//y += 0.5 * global.rate;
y += 1100/(86*room_speed)*global.rate/0.4;

if( y > 1175)
{
	if (global.GAME_OVER_ABOUT_CAMBODIA) {
		room_goto(rmGameOverOriginal);
	}
	else {
		room_goto(rmGameOver);
	}
}