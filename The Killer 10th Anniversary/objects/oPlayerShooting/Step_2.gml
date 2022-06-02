// We put shooting stuff in end step so that oGun.image_angle gets a chance to update when player
// actually clicks. Otherwise image angle will be wrong for touch devices that don't update until click.
if(mouse_check_button(mb_left) && !global.shotFired && allowShoot)
{
	audio_stop_all();
	global.shotFired = true;
	
	audio_play_sound(sndGunshot, 999, false);
	global.playSounds = false;
	
	//Merciful shot?
	if(global.gun.image_angle > 15 and global.gun.image_angle < 340)
	{
		global.rate = 0.4;
		show_debug_message("mercy shot");
		global.mercifulShot = true;
		global.playSounds = false;
		alarm_set(4, 3*room_speed/global.rate);
	}
	else
	{
		if(global.MUSIC_WHILE_WALKING){
			global.rate = 0.4;
			alarm[1] = 1;
		}
		else{
			global.rate = 0.05;
			alarm[5] = 5 * room_speed;	
			alarm[6] = 5 * room_speed;	
		}
		
		alarm_set(2, 1);
	}
	
	instance_destroy(global.crossHair);
}