if (global.debug) {
	if(keyboard_check_pressed(ord("T"))) {
		with(instance_create_depth(room_width+0, 175, 0, oBarrenTree)) {
			show_debug_message("Created " + string(type) + " with id: " + string(id));
		}
	}
	else if(keyboard_check_pressed(ord("R"))) {
		with(instance_create_depth(room_width+0, 175, 0, oFrozenRiver)) {
			show_debug_message("Created " + string(type) + " with id: " + string(id));
		}
	}	
}
