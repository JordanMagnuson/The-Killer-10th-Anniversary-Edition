if (USE_MULTIPLY_BLENDMODE) {
	// Draw night overlay on its own surface. Required for multiply blendmode to work properly.
	if(!variable_global_exists("sunset_overlay_surface") || !surface_exists(global.sunset_overlay_surface)) {
		global.sunset_overlay_surface = surface_create(room_width, room_height);
	}	
	
	surface_set_target(global.sunset_overlay_surface);
	// Both the surface alpha and the sprite alpha need to be set appropriately for multiply blendmode to work.
	draw_clear_alpha(c_white, image_alpha); // Set surface alpha to image_alpha.
	draw_sprite_ext(sprite_index,0,0,0,1,1,0,c_white,image_alpha);
	surface_reset_target();

	// Draw the surface using multiply blendmode.
	gpu_set_blendmode_ext(bm_zero, bm_src_color);	// Multiply blendmode.
	draw_surface(global.sunset_overlay_surface, 0, 0);
	gpu_set_blendmode(bm_normal);
}
else {
	draw_self();
}