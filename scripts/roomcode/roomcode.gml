// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function roomcode(){
	fadein()
	if !instance_exists(oPlayer) {
		instance_create_layer(global.target_x,global.target_y,"Player", oPlayer)
	}
	if !instance_exists(oCamera) {
		instance_create_layer(global.target_x, global.target_y, "Player", oCamera)
	}
	if !audio_is_playing(sdMusic) {
		audio_play_sound(sdMusic,1,true)
	}
	
	window_set_cursor(cr_none)
}