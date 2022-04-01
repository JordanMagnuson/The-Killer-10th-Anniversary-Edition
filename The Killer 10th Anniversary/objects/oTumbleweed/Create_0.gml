event_inherited();
sprite_index = sprTumbleweed;

type = oTumbleweed;
Item(sprite_index, "close", false);
image_speed = 5;

	
//hit box
sprite_set_offset(sprite_index, 0, sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
 