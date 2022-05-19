if(mouse_check_button(mb_left) and !global.shotFired)
{
	audio_stop_all();
	global.shotFired = true;
	
	audio_play_sound(sndGunshot, 999, false);
	global.playSounds = false;
	
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
		if(global.MUSIC_WHILE_WALKING){
			alarm[1] = 1;
		}
		else{
			alarm[5] = 5 * room_speed;	
		}
		
		alarm_set(2, 1);
	}
	
	global.rate = 0.4;
	instance_destroy(global.crossHair);
}