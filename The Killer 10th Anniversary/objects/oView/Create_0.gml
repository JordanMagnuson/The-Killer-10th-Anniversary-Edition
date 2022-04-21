_toFollow = "";
_within = "";
_speed = "";

function View(toFollow, within = "", mySpeed = 1){
	x = oCamera.x;
	y = oCamera.y;

	setView(toFollow, within, mySpeed);
}

function setView(toFollow, within, mySpeed = 1){
	_toFollow = toFollow;
	_within = within;
	_speed = mySpeed;
}	

