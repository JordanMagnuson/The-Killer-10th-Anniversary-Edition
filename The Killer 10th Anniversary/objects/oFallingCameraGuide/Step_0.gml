//y += fallSpeed * global.rate;
y += 1100/(86*room_speed);

if(y > 1175)
{
	show_debug_message("Going to gameOver Room");
	room_goto_next();
}
