// Game settings.
global.ALLOW_MUSIC_OPTION = true;				// Whether to give the player the choice to have music or ambient sounds in game.
global.MUSIC_WHILE_WALKING = false;			// Default music or no music of choice is not given?
global.GAME_OVER_ABOUT_CAMBODIA = true; // Show the original game over sequence with information about Cambodia, or just a "Thanks for playing" black screen?

// Global constants
// Day-evening-night cycle = 95 seconds
// If music starts from beginning, we want walk to take between 3:00 and 3:50
global.WALKING_SPEED = 100;
// Music fade in at beach times: 90, 60, 60
global.MIN_TIME_IN_JUNGLE = 80; // 60	
global.MIN_TIME_IN_FOREST = 50; // 45
global.MIN_TIME_IN_BEACH = 50; 	// 45
// Music fade in at beach times: 120, 60, 120
global.MAX_TIME_IN_JUNGLE = 100;	// 90
global.MAX_TIME_IN_FOREST = 65;		// 90
global.MAX_TIME_IN_BEACH = 65;		// 90
		
global.timeInJungle = global.MIN_TIME_IN_JUNGLE + random(1) * (global.MAX_TIME_IN_JUNGLE - global.MIN_TIME_IN_JUNGLE);
global.timeInForest = global.MIN_TIME_IN_FOREST + random(1) * (global.MAX_TIME_IN_FOREST - global.MIN_TIME_IN_FOREST);
global.timeInBeach = global.MIN_TIME_IN_BEACH + random(1) * (global.MAX_TIME_IN_BEACH - global.MIN_TIME_IN_BEACH);
		
global.START_MUSIC_IN = global.timeInJungle + global.timeInForest + 10;
global.MUSIC_IN_DURATION = 30;		
		
global.EARLIEST_EXPLOSION = global.timeInJungle;
global.LATEST_EXPLOSION = global.timeInJungle + global.timeInForest + global.timeInBeach;
global.EXPLOSION_CHANCE = 0.25;
		
// Global variables
global.shouldExplode = false;
global.explosionTime = 0;
global.exploded = false;
global.startedWalking = false;
global.firstPush = false;
global.farEnough = true;
global.playSounds = true;
global.fadeSounds = false;
global.shotFired = false;
global.mercifulShot = false;
global.stillInJungle = true;
global.touchedPlains = false;
global.reachedPlains = false;
global.numberOfStops = 0;
global.locationChanges = 0;
global.rate = 1;
rate = global.rate;
global.endScreen = 0;


//TEMPORARILY SET THIS CHUNK OF VARIABLES EQUAL TO 0 UNTIL I UNDERSTAND WHAT THEY ARE FOR
global.server = 0;
global.player = 0;
global.playerShooting = 0;
global.gun = 0;
global.victim = 0;
global.victimStillRun = 0;
global.deadVictim = 0;
global.deadUnderground = 0;
global.crossHair = 0;
global.view = 0;
global.timeCounter = 0;


//globals from walk or die
// Debug?
global.debug = false;
global.show_bounding_boxes = false;

// Use smooth (sub-pixel) scrolling, or retro-style integer pixel scrolling?
// This option is new from original AS3 source (which used integer pixel scrolling).
global.smooth_scrolling = true;

// Object globals.
global.player_speed = 100;
global.cloud_min_speed = 0.1;
global.cloud_max_speed = 0.5;
global.cloud_avg_speed = global.cloud_min_speed + (global.cloud_max_speed - global.cloud_min_speed) / 2;

//Globals for rare objects
global.oCastleSeen = false;
global.oPyramidsSeen = false;
global.oGiantPineSeen = false;
global.oFlowerTreeSeen = false;
global.oSnowmanSeen = false;

// Is this a touch device?
// Note that newer iPads are unfortunately hard to detect as ios, as they tend to return os type os_macosx.
// Might be able to do it with os_get_info().
global.is_touch_device = 0;
switch (os_type) {
	case os_ios:
	case os_android:
	case os_winphone:
		global.is_touch_device = 1;
		break;
	case os_macosx:
		global.is_touch_device = -1;	// Unknown, could be iPad with iOS.
		break;
}
switch (os_device) {
	case device_ios_ipad:
	case device_ios_ipad_retina:
		global.is_touch_device = 1;
		break;	
}
switch (os_browser) {
	case browser_ie_mobile:
	case browser_safari_mobile:
		global.is_touch_device = 1;
		break;	
}

// Disable double click registering as right click. (Can mess up touch devices when right click is not needed.)
device_mouse_dbclick_enable(false);