image_angle -= 1;

if( y > 1175)
{
	room_goto_next();
}

//Stop animation
if(image_index >= 3)
{
	image_speed = 0;
}