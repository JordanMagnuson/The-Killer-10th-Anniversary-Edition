event_inherited();

FADE_OUT_DURATION = 5;
fade = false;
//graphic
sprite_index = sprPlayerDying;
image_index = 0;
image_speed = 2;

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, -sprite_height, 0, sprite_height, bboxkind_rectangular,0);

//gravestone alarm
alarm[0] = FADE_OUT_DURATION*room_speed;

function fadeOut(){
	playerDying = instance_create_depth(0, 0, 0, oGravestone);
}


