// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function savegame(){
	if file_exists("Save.sav") {
		file_delete("Save.sav")
	}
	ini_open("Save.sav")
	ini_write_real("Progress","room", global.checkpoint_room)
	ini_write_real("Progress","x",global.checkpoint_x)
	ini_write_real("Progress","y",global.checkpoint_y)
	ini_write_real("Progress","score",global.score)
	ini_close()
}