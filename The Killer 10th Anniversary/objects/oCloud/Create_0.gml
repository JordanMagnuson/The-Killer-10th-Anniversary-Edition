event_inherited();
randomise();

//NEED TO FIND OUT APPROPRIATE HEIGHT
MAX_HEIGHT = 130;
MIN_HEIGHT = 20;
MAX_SPEED = global.cloud_max_speed;
MIN_SPEED =	global.cloud_min_speed;
y = MIN_HEIGHT + random(1) * (MAX_HEIGHT - MIN_HEIGHT);

// Allow variable cloud speed. New from original AS3 source.
cloud_speed = MIN_SPEED + random(1) * (MAX_SPEED - MIN_SPEED);
integer_pixel = 0;

//fix this later
mySpriteCollection = [sprCloud01, sprCloud02, sprCloud03, sprCloud04, sprCloud05, sprCloud06, sprCloud07, sprCloud08];
//rawSprite = choose(mySpriteCollection);

sprite_index = choose(sprCloud01, sprCloud02, sprCloud03, sprCloud04, sprCloud05, sprCloud06, sprCloud07, sprCloud08);
type = oCloud;
Item(sprite_index, "mid", true );
depth = 105;
