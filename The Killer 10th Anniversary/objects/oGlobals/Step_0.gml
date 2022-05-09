if(rate != global.rate){
	show_debug_message("changing global.rate from " + string(rate) + " to: " + string(global.rate));
	rate = global.rate;
	room_speed = global.rate * 60;
}