y += fallSpeed * global.rate;

if(y > 1175)
{
	show_debug_message("Going to gameOver Room");
	room_goto_next();
}
