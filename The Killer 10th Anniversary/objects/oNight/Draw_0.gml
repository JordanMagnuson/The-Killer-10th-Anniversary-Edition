// Setting blendmode to multiply here currently does not work, as it does not take alpha into account.
// Probably need to use surfaces and/or shaders to achieve the multiply effect from the original game.
//gpu_set_blendmode_ext(bm_dest_colour, bm_zero);	// Multiply blend mode. Equivalent to gpu_set_blendmode_ext(bm_zero, bm_src_color);
draw_self();
//gpu_set_blendmode(bm_normal);
