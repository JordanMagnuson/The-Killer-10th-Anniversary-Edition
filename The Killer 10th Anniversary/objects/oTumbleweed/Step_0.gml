// Inherit the parent event
event_inherited();

// Make it move even when player is not walking.
if (!instance_exists(oPlayer) || !oPlayer.walking) {
	x -= (global.player_speed / 100);
}