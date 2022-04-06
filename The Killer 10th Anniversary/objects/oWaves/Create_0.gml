FADE_IN_DURATION = 12;
FADE_OUT_DURATION = 8;

SPEED = 10;
X_INIT = -10;

fadeInCalled = false;
fadeOutCalled = false;

/**
* Direction is 1 or -1, makes the wase move back and forth;
*/
waveDirection= 1; //direction changed to wave direction, direction means something in GML

sprite_index = sprWaves01;
image_alpha = 0;
type = oWaves;

//Hit box to bottom left
sprite_set_offset(sprite_index, 0, sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

x = X_INIT;
y = room_height;

instance_create_depth(0,0,0, oWaterCover);

function fadeIn(){
	fadeInCalled = true;
}

fadeIn();

function fadeOut(){
	fadeOutCalled = true;	
}