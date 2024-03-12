//x movement
xspd = current_dir * xspd_max

//y movement
yspd += grav
yspd = clamp(yspd, -yspd_max, yspd_max)
 

if place_meeting(x+xspd, y, oBlock) {
	var onepixel = sign(xspd)
	while !place_meeting(x + onepixel,y,oBlock) x+= onepixel
	xspd = 0
	current_dir *= -1
}
x+=xspd

if place_meeting(x, y+yspd, oBlock) {
	var onepixel = sign(yspd)
	while !place_meeting(x,y+onepixel,oBlock) y += onepixel
	yspd = 0
}
y+=yspd
if !global.invin_enemies{
	if place_meeting(x,y, oPlayer) {
			with oPlayer {
				death()
			}
		}
}

if place_meeting(x,y,oWeapon) {
	instance_create_layer(x,y,"Bad",oExplosion)
	screenshake(5,20)
	if !audio_is_playing(sdDeath) {
			audio_play_sound(sdDeath,1,false)
		}
	global.score+=1
	instance_destroy()
}

