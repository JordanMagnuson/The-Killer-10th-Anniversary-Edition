event_inherited();

animationSpeed = 0.05;
FADE_IN_DURATION = 5;

sprite_index = sprGravestone;
image_alpha = 0;

if(oLocation.locationType == "forest"){
	sprite_index = sprGravestoneForest;
}
else if(oLocation.locationType == "snow"){
	sprite_index = sprGravestoneSnow;
}
if(oLocation.locationType == "desert"){
	sprite_index = sprGravestoneDesert;
}
if(oLocation.locationType == "plains"){
	sprite_index = sprGravestonePlains;
}
if(oLocation.locationType == "beach"){
	sprite_index = sprGravestoneBeach;
}

image_speed = animationSpeed;
x = 57;
y = oGround.y;

depth = -1;

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, -sprite_height, 0, sprite_height, bboxkind_rectangular,0);
