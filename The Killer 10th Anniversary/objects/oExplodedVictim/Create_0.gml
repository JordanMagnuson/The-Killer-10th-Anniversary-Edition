sprite_index = sprVictimDead;

x = oVictim.x;
y = oVictim.y + sprite_height; //dead victim was floating, not sure why. Increased y value to brute force fix

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);