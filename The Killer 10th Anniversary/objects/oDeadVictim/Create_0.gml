MAX_FALL_SPEED = 1;
fallSpeed = .02;

image_speed = 1;
depth = -50;

/*
//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
*/
instance_create_depth(0,0,0,oView);
oView.View(self,[0,0, room_width, 1200], 1);
