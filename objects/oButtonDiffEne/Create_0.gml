off_text = "OFF"
on_text = "ON"
x = display_get_gui_width()/2
if global.invin_enemies == false {
	text = off_text
} else {
	text = on_text
}

x1 = x - (sprite_width/2)
y1 = y - (sprite_height/2)
x2 = x + (sprite_width/2)
y2 = y + (sprite_height/2)

hover = false


description = "INVINCIBLE To Enemies"


