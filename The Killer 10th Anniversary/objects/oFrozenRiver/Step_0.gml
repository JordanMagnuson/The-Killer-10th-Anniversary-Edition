event_inherited();
if(x <= 52 && x > 45 && !audio_is_playing(sndCreaking)){
	var vol = 0.2*0.5 *random(1);
	audio_emitter_gain(sEmit6, vol);
	audio_play_sound_on(sEmit6, sndCreaking, false, 20);
}