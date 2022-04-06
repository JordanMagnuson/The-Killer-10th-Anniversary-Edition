PUSH_DISTANCE = 10;

animSpeed = 0;
walking = false;
canPush = true;

sprite_index = sprKillerWalk;

animSpeed = global.WALKING_SPEED / 10;
image_speed = animSpeed;
//created seperate sprites for stand, push, walk, and standing push

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

sprite_index = sprKillerStand;
//hit box must be set for each sprite
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

x = 50;
y = 175; //SHOULD BE OGROUND.Y BUT OGROUND DOES NOT YET EXIST

sEmit = audio_emitter_create();

function standingPush(){
	audio_emitter_gain(sEmit, 0.5);
	if(global.playSounds)
		audio_play_sound_on(sEmit,sndKillerPush, false, 100);
	sprite_index = sprKillerStandingPush;
	//hit box must be set for each sprite
	sprite_set_offset(sprite_index, 0,sprite_height);
	sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
	
	//Reset Victim's Stumble Time
	global.victim.alarm[2] = global.victim.STUMBLE_TIME * room_speed;
}

function push(){
	var vol = 0.3+0.2+ random(1);
	audio_emitter_gain(sEmit, vol);
	if(global.playSounds)
		audio_play_sound_on(sEmit,sndKillerPush, false, 100);
	sprite_index = sprKillerPush;
	//hit box must be set for each sprite
	sprite_set_offset(sprite_index, 0,sprite_height);
	sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
	
	//Reset Victim's Stumble Time
	global.victim.alarm[2] = global.victim.STUMBLE_TIME * room_speed;
}