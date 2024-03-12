if distance_to_point(mouse_x, mouse_y) <= 0 {
	
	if !hover audio_play_sound(sdButtonHover,1,false)
	hover = true
	if mouse_check_button_pressed(mb_any) {
		audio_play_sound(sdClicked,1,false)
		fadeout(Title, 0, 0)
	}
	
}else {
	hover = false
}









