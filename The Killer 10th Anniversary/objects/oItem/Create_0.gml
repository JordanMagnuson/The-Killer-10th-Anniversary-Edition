distance = "";

moveDist = 0;
moveCounter = 0;

overlap = false;

//---------------------------------------------------------------
// New 'canDestroy' variable not in original AS3 source code. 
// Used by objects like oRiver to prevent being desroyed while sound is still playing.
canDestroy = true;
//---------------------------------------------------------------

function Item(sprite, distance = "mid", overlap = true){
	self.distance = distance;			
	self.overlap = overlap;
	sprite_index = sprite; 
	
	// Hit box to bottom left, so we can place all items at same starting location		
	sprite_set_offset(sprite_index, 0, sprite_height);
	sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
	
	// Randomly flip some sprites. In this case the sprite x offset will also flip (to bottom right), so we need to move the object's x position accordingly.
	if (random(1) > 0.5){
		image_xscale = -1;
		x += sprite_width * image_xscale;
	}			

	// Create every item at the far right edge of the screen
	//x = room_width + 10 + sprite_width;
	//y = 175; //hard coded, this should be oGround.y
	
	// Layer
	switch (distance){
		case "close":
			depth = choose(-100, -101);
			break;
		case "mid":
			depth = choose(10, 11);
			break;
		case "far":
			depth = choose(100, 101);
			break;
	}
	
	/**
		* When an item is added to the world, check to see if it can overlap 
		* others of its type. If not, and it is overlapping, remove it.
	*/
	if(overlap == false){
		if(place_meeting(x,y, self.type)){
			instance_destroy(self);
			//show_debug_message("Destroyed self due to overlap");
		}
	} 
}	
function offScreenAction() {
	// 'canDestroy' variable is new from original AS3 source code. See above.
	if (canDestroy) {
		//show_debug_message(string(self.type) + ": CAN destroy");
		destroy();	
	}
	else {
		//show_debug_message(string(self.type) + ": CANNOT destroy");
	}
}

function destroy(){
	instance_destroy(self);	
}
/**
	* Choose an image randomly from an array of sprite references
	* @param	collection	An array of raw sprite references like private const PLAYER:Class;
	* @return	A sprite chosen at random.
*/
function chooseSprite(collection){
	var rand = collection.length * random(1);	
	return collection[rand];
}

