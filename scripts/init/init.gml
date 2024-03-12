// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init(){
	global.checkpoint_room = Level1;
	global.checkpoint_x = 128;
	global.checkpoint_y = 896;
	global.checkpoint_id = noone;
	global.target_x = global.checkpoint_x
	global.target_y = global.checkpoint_y
	global.score = 0
	global.invin_enemies = false
	global.invin_obstacles = false
	if !audio_is_playing(sdMusic) {
		audio_play_sound(sdMusic,1,true)
	}
	window_set_cursor(cr_default)
}