// Changing game speed for slow motion/"bullet time" effect can make things like camera movement janky.
// Better to just slow down the things we want to slow down. See https://www.youtube.com/watch?v=vNmIZcoc_Pw
//if(rate != global.rate){
//	show_debug_message("changing global.rate from " + string(rate) + " to: " + string(global.rate));
//	rate = global.rate;
//	room_speed = global.rate * 60;
//}