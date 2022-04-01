if(keyboard_check_pressed(ord("R"))and global.debug){
	if(!instance_exists(oRiver))
		instance_create_depth(room_width+10, 175,0, oRiver);
}
