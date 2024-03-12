if instance_exists(oPlayer) {
	if oPlayer.image_xscale > 0 {
		x = oPlayer.x+24
		y = oPlayer.y-10
	} else {
		image_xscale = oPlayer.image_xscale
		x = oPlayer.x -24
		y = oPlayer.y -10
	}
} else {
	instance_destroy()
}






