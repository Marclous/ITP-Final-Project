if global.checkpoint_id = id {
	image_index = 1;
}else {
	image_index = 0;
	
	if place_meeting(x,y, oPlayer) {
		global.checkpoint_room = room
		global.checkpoint_x = x
		global.checkpoint_y = y
		global.checkpoint_id = id
		
		savegame()
		audio_play_sound(sdCheckpoint,1,false)
		
		screenshake(5,20)
	}
	
}

if place_meeting(x,y, oPlayer) && image_index = 0 {
	textfade = textfade_max
}else {
	textfade = max(0, textfade-1)
}

