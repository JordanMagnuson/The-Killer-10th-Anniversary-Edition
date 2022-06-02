// Live coding with GMLive extension. See https://yal.cc/r/17/gmlive/
//if (global.debug && live_call()) {
//	return live_result;
//}	

w = display_get_gui_width();
h = display_get_gui_height();

draw_set_color(c_black);
draw_rectangle(0, 0, w, h, false);
draw_set_color(c_white);

//show_debug_message("gui_scale: " + string(global.gui_scale));
draw_sprite_ext(spr_require_landscape, 0, w/2, h/2, global.gui_scale/4, global.gui_scale/4, 0, c_white, 1);