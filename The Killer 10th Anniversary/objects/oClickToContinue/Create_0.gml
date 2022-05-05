FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;

sprite_index = sprClickToContinueBlack;
//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

alpha = 0;

x = room_height/2 + 25;
y = room_width/2;


fadein = true;	