image_angle -= 1 *global.rate;
//y += 0.5 * global.rate;
y += 1100/(86*room_speed);

if( y > 1175)
{
	if (global.GAME_OVER_ABOUT_CAMBODIA) {
		room_goto(rmGameOverOriginal);
	}
	else {
		room_goto(rmGameOver);
	}
}

//Stop animation
if(image_index >= 4)
{
	image_speed = 0;
}