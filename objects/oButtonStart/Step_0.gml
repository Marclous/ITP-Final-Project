if distance_to_point(mouse_x, mouse_y) <= 0 {
	
	if !hover audio_play_sound(sdButtonHover,1,false)
		hover = true
	if mouse_check_button_pressed(mb_any) {
		
		audio_play_sound(sdClicked,1,false)
		
		if file_exists("Save.sav"){
			loadgame()	
		} else {
			fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y)
		}

	}
	
}else {
	hover = false
}









