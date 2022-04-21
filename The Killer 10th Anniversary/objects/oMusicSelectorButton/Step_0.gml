if(point_in_rectangle(mouse_x, mouse_y, 81, 128, 260, 220)){
	visible = true;
	if(mouse_check_button_pressed(mb_left)){
		global.MUSIC_WHILE_WALKING = true;
		//global.server.sendMusicChoice();
		room_goto(rmMyWorld);
	}
}
else{
	visible = false;	
}