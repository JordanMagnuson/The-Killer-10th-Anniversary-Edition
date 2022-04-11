if(mouse_check_button(mb_left) and !global.shotFired)
{
	global.shotFired = true;
	//PORT TODO: play gunshot
	
	//Merciful shot?
	if(global.gun.image_angle > 15 and global.gun.image_angle < 340)
	{
		show_debug_message("mercy shot");
		global.mercifulShot = true;
		global.playSounds = false;
		alarm_set(4, MAX_TIME_TILL_KNEEL * random(1) + MIN_TIME_TILL_KNEEL);
	}
	else
	{
		alarm_set(1, 1);
		alarm_set(2, 1);
	}
	
	//FP.rate = .04			Not sure how to convert this
	instance_destroy(global.crossHair);
	
}