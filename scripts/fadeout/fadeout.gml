// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fadeout(_targetroom,_target_x,_target_y){
	global.target_x = _target_x
	global.target_y = _target_y
	if !instance_exists(oFade) {
		var _fade = instance_create_layer(0,0,"Player",oFade)
		with _fade {
			alpha = 0
			fade_out = true
			target = _targetroom
		}
	}
}