// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function death(){
	
	if !file_exists("Save.sav"){
		fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y)
	} else {
		loadgame()
	}
	
	fadeout(global.checkpoint_room,global.checkpoint_x,global.checkpoint_y)
	instance_create_layer(x,y,"Player", oExplosion)
	screenshake(12,60)
	if !audio_is_playing(sdDeath) {
			audio_play_sound(sdDeath,1,false)
		}
	instance_destroy()
}