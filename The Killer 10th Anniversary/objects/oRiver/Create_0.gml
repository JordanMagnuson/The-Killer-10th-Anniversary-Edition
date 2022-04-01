event_inherited();
fadeIn = false;
fadeOut = false;
fadeStarted = false;
canDestroy = false;

//---------------------------------------------------------------
// Create audio emitter to handle sound. 
// This is different from original source.
// See tutorial at https://www.youtube.com/watch?v=ZpPBlD9FyKw
behindPlayer = false;
sndEmit = audio_emitter_create();
sndMaxDist = room_width - sprite_width;
sndDropoffDist = sndMaxDist/2;
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(sndEmit, x, y, 0);
audio_emitter_falloff(sndEmit, sndDropoffDist, sndMaxDist, 1);
sndPlaying = false;
//---------------------------------------------------------------

sprite_index = sprRiver;
type = oRiver;
Item(sprRiver, "mid", false);
image_speed = 10;

depth = 9;

// Hit box to bottom left, so we can place all items at same starting location		
sprite_set_offset(sprite_index, 0, 3);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, -3, bboxkind_rectangular,0);