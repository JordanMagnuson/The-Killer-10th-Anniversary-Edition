if(inProcess){
	currentGain00 -= 1/(FADE_DURATION/2 * room_speed);
	audio_emitter_gain(soundEmitter00, currentGain00);
	if(currentGain00 <= 0.1){
		fadeComplete();	
	}	
	if(currentGain01 <1){
		currentGain01 += 1/(FADE_DURATION/2 * room_speed)
		audio_emitter_gain(soundEmitter01, currentGain01);
	}
}
