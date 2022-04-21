dist = point_distance(_toFollow.x - room_width/2, _toFollow.y - 68 - room_height, oCamera.x, oCamera.y);
spd = dist/_speed;

move_towards_point(_toFollow.x, _toFollow.y, spd);

oCamera.x = x;
oCamera.y = y;

/*
within[0] = x;
within[1] = y;
within[2] = width;
within[3] = height;
*/

//stay within constraints
if(_within != ""){
	if( oCamera.x < _within[0])
		oCamera.x = _within[0];	
		
	if(oCamera.y < _within[1])
		oCamera.y = _within[1];
	
	if(oCamera.x + room_width > _within[0] + _within[2])
		oCamera.x = _within[0] + _within[2] - room_width;
		
	if(oCamera.y + room_height > _within[0] + _within[3])
		oCamera.y = _within[1] + _within[3] - room_height;
}