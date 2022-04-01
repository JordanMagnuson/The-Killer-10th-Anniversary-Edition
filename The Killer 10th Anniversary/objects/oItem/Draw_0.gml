draw_self();

// Debug: draw origin and bounding box.
if (global.show_bounding_boxes) {
	if (image_xscale == 1) {
		draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_green,c_green,c_green,c_green,true);
		draw_rectangle_colour(x-1,y-1,x+1,y+1,c_green,c_green,c_green,c_green,false);
	}
	else {
		draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true);
		draw_rectangle_colour(x-1,y-1,x+1,y+1,c_red,c_red,c_red,c_red,false);
	}
}

	