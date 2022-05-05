dist = point_distance(_toFollow.x, _toFollow.y + 68 - room_height/2, x, y);
spd = dist/_speed;
if(dist > 5){
	//move_towards_point is creating a super choppy effect, testing fall speed of deadVictim instead
	//move_towards_point(_toFollow.x, _toFollow.y + 68 - room_height/2, spd);
	y += 0.5 * global.rate;
}
else{
	speed = 0;
}

//oCamera.x = x;
//oCamera.y = y;

/*
within[0] = x;
within[1] = y;
within[2] = width;
within[3] = height;
*/
/*
//stay within constraints
//THESE CONSTRAINTS ARE MAKING THE Y VALUE JUMP BACK TO 0 WHICH CAUSES THE SCREEN TO FLASH
if(_within != ""){
	if( x < _within[0])
		x = _within[0];	
		
	if(y < _within[1])
		y = _within[1];
	
	if(x + room_width > _within[0] + _within[2])
		x = _within[0] + _within[2] - room_width;
		
	if(y + room_height > _within[0] + _within[3])
		y = _within[1] + _within[3] - room_height;
}
*/
camera_set_view_pos(view_camera[0], 0, y);
counter ++;
if(counter == 60){
	show_debug_message("x: " + string(x) + "   Y: " + string(y));
	show_debug_message("toFollow.y: " + string(_toFollow.y) + "my y: " + string(y) + "   spd: " + string(spd));
	counter = 0;
}