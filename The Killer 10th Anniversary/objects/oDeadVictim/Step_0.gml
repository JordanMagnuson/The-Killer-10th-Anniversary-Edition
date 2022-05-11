image_angle -= 1 *global.rate;
y += 0.5 * global.rate;

if( y > 1175)
{
	room_goto_next();
}

//Stop animation
if(image_index >= 4)
{
	image_speed = 0;
}