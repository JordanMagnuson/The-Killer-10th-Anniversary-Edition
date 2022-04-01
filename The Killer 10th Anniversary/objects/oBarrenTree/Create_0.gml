event_inherited()

sprite_index = choose(sprBarrenTree01, sprBarrenTree02, sprBarrenTree03);
type = oBarrenTree;
Item(sprite_index, "mid", true);

canDestroy = false;		// New from AS3 source.

//---------------------------------------------------------------
// Create audio emitter to handle sound. 
// This is different from original source.
// See tutorial at https://www.youtube.com/watch?v=ZpPBlD9FyKw
mySound = false;
behindPlayer = false;
sndEmit = audio_emitter_create();
sndMaxDist = room_width - sprite_width;
sndDropoffDist = sndMaxDist/2;
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(sndEmit, x, y, 0);
audio_emitter_falloff(sndEmit, sndDropoffDist, sndMaxDist, 1);
//---------------------------------------------------------------