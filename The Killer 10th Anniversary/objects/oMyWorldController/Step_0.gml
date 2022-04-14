if(keyboard_check_pressed(vk_f12)){
	global.shouldExplode = true;
	global.explosionTime = global.EARLIEST_EXPLOSION + random(1) * (global.LATEST_EXPLOSION - global.EARLIEST_EXPLOSION);
	alarm[3] = global.explosionTime;
	show_debug_message("Explosion set to " + string(global.explosionTime));
}
if(keyboard_check_pressed(vk_f11)){
	global.shouldExplode = false;
	global.explosionTime = 5000;
	alarm[3] = -1; //cancels the explosion alarm regardless of whether is was previously set
	show_debug_message("Explosion cancelled");
}

if(keyboard_check_pressed(vk_f7)){
	explode();	
}

if(keyboard_check_pressed(vk_f6)){
	show_debug_message("c pressed");
	changeLocation();
}

if(keyboard_check_pressed(vk_f5) && !musicStarted){
	show_debug_message("Music fading in");
	global.playSounds = false;
	global.fadeSounds = true;
	musicStarted = true;
	//soundController.fadeOut(); //ADD THIS LINE WHEN THE SOUND CONTROLLER IS CREATED
	//music.loop(0) I'M NOT SURE HOW TO CONVERT THIS
	//musicFader.fadeTo(1, Global.MUSIC_IN_DURATION); I'M NOT SURE HOW TO CONVERT THIS
}

// Flip oddFrame every frame
oddFrame *= -1;

// Update thirdFrame
if(thirdFrame == 3)
{
	thirdFrame = 1;
}
else
{
	thirdFrame += 1;
}

// Update fourthFrame
if(fourthFrame == 4)
{
	fourthFrame = 1;
}
else
{
	fourthFrame += 1;
}

// Time to switch out of jungle?
if(oPlayer.walking && global.locationChanges == 0 && global.timeCounter.timePassedSinceLastLocationChange >= global.timeInJungle){
	show_debug_message("Exceeded time in jungle - change out");
	changeLocation();
	global.stillInJungle = false;
}
else if (oPlayer.walking && global.locationChanges == 1 && global.timeCounter.timePassedSinceLastLocationChange >= global.timeInForest){
	show_debug_message("Exceeded time in forest - change out")	
	changeLocation();
}
else if (oPlayer.walking && global.locationChanges == 2 && global.timeCounter.timePassedSinceLastLocationChange >= global.timeInBeach){
	show_debug_message("Exceeded time in beach - change out")	
	changeLocation();
}
