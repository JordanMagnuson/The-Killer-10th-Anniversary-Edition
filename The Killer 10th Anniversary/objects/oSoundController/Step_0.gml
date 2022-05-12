
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

if(fadingOut){
	currentGain00 -= (1/duration)*room_speed;
	currentGain01 -= (1/duration)*room_speed;
	audio_emitter_gain(soundEmitter00, currentGain00);
	audio_emitter_gain(soundEmitter01, currentGain01);
}

//update 
if(global.playSounds && !global.fadeSounds && !soundsStopped){
	stopSounds();	
}
