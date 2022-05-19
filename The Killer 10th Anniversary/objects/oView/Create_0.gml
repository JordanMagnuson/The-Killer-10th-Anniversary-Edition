_toFollow = "";
_within = "";
_speed = "";

function View(toFollow, within = "", mySpeed = 1){
	x = 0;
	y = camera_get_view_y(view_camera[0]);

	setView(toFollow, within, mySpeed);
}

function setView(toFollow, within, mySpeed = 1){
	_toFollow = toFollow;
	_within = within;
	_speed = mySpeed;
}	

counter = 0;