if(point_in_rectangle(mouse_x, mouse_y, 0, 0, 179, 93)){
	visible = true;
	if(mouse_check_button_pressed(mb_left)){
		global.MUSIC_WHILE_WALKING = true;
		//global.server.sendMusicChoice();
		instance_create_depth(0,0,0, oMyWorldController);
	}
}
else{
	visible = false;	
}