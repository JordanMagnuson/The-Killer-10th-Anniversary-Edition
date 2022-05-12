event_inherited();

//---------------------------------------------------------------
// Play sound on emitter.
// This is different from original source.
if (!sndPlaying and !global.MUSIC_WHILE_WALKING) {
	audio_play_sound_on(sndEmit, sndStream, true, 1);
	sndPlaying = true;
}

// Allow to be destroyed once sound is out of earshot.
if (distance_to_object(oPlayer) > sndMaxDist) {
	canDestroy = true;
}

// Move the emitter with the river.
audio_emitter_position(sndEmit, x, y, 0);

// Drop off sound faster when object is behind player.
if (!behindPlayer and x < oPlayer.x) {
	show_debug_message("River " + string(id) + " is now behind player. Dropping off sound.")
	sndMaxDist /= 2;
	sndDropoffDist = sndMaxDist/2;
	audio_emitter_falloff(sndEmit, sndDropoffDist, sndMaxDist, 1);	
	behindPlayer = true;
}
//---------------------------------------------------------------

if(fading){
	var gain = audio_emitter_get_gain(sndEmit) - 1/(10*room_speed);
	if(gain <= 0.1){
		instance_destroy(self);
	}
	audio_emitter_gain(sndEmit, gain);	
}

if(global.shotFired)
{
	fading = true;
}