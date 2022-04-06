X = keyboard_check(vk_space);

if(global.playSounds && walking && !audio_is_playing(sndWalking)){
	audio_play_sound(sndWalking, 75, true);
}
else if(!global.playSounds){
	audio_stop_sound(sndWalking);
}

if(X){
	if(global.exploded){
		walking = false;
		return;
	}
	if(!global.startedWalking){
		//global.timeCounter.started = true; ADD LINE AFTER TIME COUNTER IS IMPLEMENTED
		if(global.MUSIC_WHILE_WALKING){
			//oSoundController.fadeout(5); //	OSOUNDCONTROLLER IS NOT MADE YET
			//(FP.world as MyWorld).music.loop();	//NOT SURE WHAT THIS DOES
		}
		standingPush();
		global.startedWalking = true;
		walking = false;
	}
	if(sprite_index == sprKillerStandingPush && image_index == 3){
		sprite_index = sprKillerWalk;
		walking = true;
	}
	
	if(sprite_index == sprKillerStand){
		sprite_index = sprKillerWalk;
		walking = true;
	}
	else if(sprite_index == sprKillerWalk){
		if(global.victim.x -x <= PUSH_DISTANCE)
			push();
		
		//Reset canPush on the 3rd frame of the walking animation
		if(image_index == 3){
			canPush = true;	
		}
		//Allow a push every time the walking animation cycles back to the 0 frame
		else if (image_index == 0 && canPush){
			if(random(1) < 0){
				push();	
			}
			canPush = false;
		}
		walking = true;
	}
	else if (sprite_index = sprKillerPush && image_index == 3){
		sprite_index = sprKillerWalk;
		canPush = true;
		walking = true;
	}
}
else{
	walking = false;
	sprite_index = sprKillerStand;
	if(audio_is_playing(sndWalking))
		audio_stop_sound(sndWalking);
}

if(keyboard_check_released(vk_space)){
	if(!global.reachedPlains){
		//instance_create_depth(0, 0, 0, oTextNotFarEnough); 	//ADD THIS LINE WHEN OTEXTNOTFARENOUGH IS CREATED
		global.numberOfStops++;
	}
	else{
		//instance_create_depth(0, 0, 0, oTextUseMouse); // ADD THIS LINE WHEN OTEXTUSEMOUSE IS CREATED	
		//instance_create_depth(0,0,0, oPlayerShooting); // ADD THIS LINE WHEN OPLAYERSHOOTING IS CREATED
		global.playerShooting.x = x;
		global.playerShooting.y = y;
		
		if(global.MUSIC_WHILE_WALKING){
			//FP.world.add((FP.world as MyWorld).soundController = new SoundController((FP.world as MyWorld).location)); //NOT SURE WHAT THIS LINE IS SUPPOSED TO DO
			//(FP.world as MyWorld).music.stop(); //NOT SURE WHAT THIS LINE DOES
			global.playSounds = true;
		}
		global.fadeSounds = false;
		audio_stop_sound(sndWalking);
		instance_destroy(self);
	}
}














