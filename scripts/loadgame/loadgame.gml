// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadgame(){
	ini_open("Save.sav")
	global.checkpoint_room = ini_read_real("Progress","room",Level1)
	global.checkpoint_x = ini_read_real("Progress","x",0)
	global.checkpoint_y = ini_read_real("Progress","y",0)
	global.score = ini_read_real("Progress","score",0)
	ini_close()
	fadeout(global.checkpoint_room,global.checkpoint_x, global.checkpoint_y)
}
