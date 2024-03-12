//Get keyboard input
if !instance_exists(oFade){
	key_left = keyboard_check(ord("A"))
	key_right = keyboard_check(ord("D"))
	key_jump = keyboard_check_pressed(vk_space)
	key_jump_held = keyboard_check(vk_space)
	key_attack = keyboard_check_pressed(ord("J"))
} else {
	key_left = 0
	key_right = 0
	key_jump = 0
	key_jump_held = 0
	key_attack = 0
}
//reduce walljumpdelay
walljumpdelay = max(walljumpdelay-1,0)

if walljumpdelay == 0 {
	//get moving direction
	var dir = key_right - key_left

	//get horizontal velocity
	xspd += dir*acceleration

	//Slow down character when no key is pressed
	if dir == 0 {
	
		if xspd < 0 {
			xspd = min(xspd + deceleration,0)
		} else {
			xspd = max(xspd - deceleration,0)
		}
	}

	xspd = clamp(xspd, -max_xspd, max_xspd)

	if onwall != 0 && !isGround && key_jump {
		walljumpdelay = walljumpdelay_max
		xspd = -onwall * xspd_wall_jump
		yspd = wall_jumpspeed
		
		if !audio_is_playing(sdJump) {
			audio_play_sound(sdJump,1,false)
		}
	}

}

var final_grav = grav
var yspd_max_final = max_yspd
if onwall != 0 && yspd > 0 {
	final_grav = grav_wall
	yspd_max_final = max_yspd_wall
}
yspd += final_grav
yspd = clamp(yspd, -yspd_max_final, yspd_max_final)


if jumpbuffer > 0 {
	jumpbuffer--
	if key_jump {
		jumpbuffer = 0
		yspd = jumpspeed
		if !audio_is_playing(sdJump) {
			audio_play_sound(sdJump,1,false)
		}
	}
}

if yspd < 0 && !key_jump_held {
	yspd = max(yspd, -3)
}


//Collision
if place_meeting(x+xspd, y, oBlock) {
	var onepixel = sign(xspd)
	while !place_meeting(x + onepixel,y,oBlock) x+= onepixel
	xspd = 0
}
x+=xspd

if place_meeting(x, y+yspd, oBlock) {
	var onepixel = sign(yspd)
	while !place_meeting(x,y+onepixel,oBlock) y += onepixel
	yspd = 0
}
y+=yspd

//Current Status
isGround = place_meeting(x, y+groundbuffer, oBlock) 
if isGround jumpbuffer = 10;

onwall = place_meeting(x+1, y, oBlock) - place_meeting(x-1, y, oBlock)


//Animation
image_speed = 1;
if xspd !=0 image_xscale = sign(xspd)
if !isGround {
	if onwall != 0 {
		sprite_index = sPlayerOnWall
		//image_xscale = -onwall
	} else {
		sprite_index = sPlayerAir
		image_speed = 0
		image_index = (yspd > 0)
	}
} else {
	if xspd != 0 {
		sprite_index = sPlayerRun
		if !audio_is_playing(sdStep) {
			audio_play_sound(sdStep,1,false)
		}
	} else {
		sprite_index = sPlayer
	}
}

//Attack
if attack_cd > 0 {
	attack_cd = max(0, attack_cd -1)
}else {
	if key_attack {
		attack_cd = attack_max 
		instance_create_layer(x+24, y-10, "Weapon", oWeapon)
		audio_play_sound(sdAttack,1,false)
		
	}
}

if place_meeting(x, y, oGold) {
	global.score += 1
}

if keyboard_check_pressed(vk_escape) {
	fadeout(Title, 0,0)
}







