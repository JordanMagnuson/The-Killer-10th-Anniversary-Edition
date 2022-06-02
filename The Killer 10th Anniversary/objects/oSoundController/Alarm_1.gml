/// @description Play current sound if audio system is now available.
// (This is a safety callback for HTML5, where audio may not always be available.)
if (audio_system_is_available() && audio_sound_is_playable(currentSound)) {
	if (!audio_is_playing(currentSound))
		audio_play_sound_on(soundEmitter00, currentSound, true, 100);
}
else {
	alarm[1] = 10;
}