if fade_out {
	if alpha < 1 {
		alpha += fade_out_rate
	}else {
		alpha = 1
		room_goto(target)
	}
} else {
	if alpha > 0 {
		alpha -= fade_in_rate
	} else {
		alpha = 0
		instance_destroy()
	}
}


