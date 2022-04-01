event_inherited();

//---------------------------------------------------------------
// Play sound on emitter.
// This is different from original source.

// Position audio emitter at tree location. This takes care of panning and fading.
audio_emitter_position(sndEmit, x, y, 0);

// Play creaking sound chance, if it is not playing globally.
if(random(1) < 0.002 and !audio_is_playing(sndCreaking)){
	show_debug_message("oBarrenTree " + string(id) + " playing sndCreaking.")
	mySound = audio_play_sound_on(sndEmit, sndCreaking, 0, 100);
}

// Drop off sound faster when object is behind player.
if (!behindPlayer and x < oPlayer.x) {
	show_debug_message("Barren tree " + string(id) + " is now behind player. Dropping off sound.")
	sndMaxDist /= 2;
	sndDropoffDist = sndMaxDist/2;
	audio_emitter_falloff(sndEmit, sndDropoffDist, sndMaxDist, 1);	
	behindPlayer = true;
}

// Only allow object to be destroyed when out of ear shot.
if (!canDestroy and distance_to_object(oPlayer) > sndMaxDist) {
	show_debug_message("oBarrenTree " + string(id) + " out of ear shot. Can destroy.");
	canDestroy = true;
}
//---------------------------------------------------------------