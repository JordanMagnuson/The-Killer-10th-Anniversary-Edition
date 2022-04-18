sprite_index = sprExplosion;
image_speed = 20;
depth = -1000;

//hit box
sprite_set_offset(sprite_index, sprite_width/2, sprite_height/2);

//Location
x = oVictim.x;
y = oGround.y + 10;

//moving sound to oMyWorld controller so the sound can play out after the explosion disappears


