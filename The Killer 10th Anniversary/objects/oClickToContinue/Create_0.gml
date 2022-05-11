FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;

sprite_index = sprClickToContinueBlack;
/*
//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
*/
image_alpha = 0;
depth = -2000;

y = room_height/4 + 25;
x = room_width/4;
image_xscale = .5;
image_yscale = .5;

fadein = true;	