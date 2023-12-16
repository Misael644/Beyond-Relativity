if obj_game.GamePause == true {
	speed = 0;
} else {
	if obj_game.TimeStop == true {
		speed = 0;
	} else {
		speed = 6;
	};
};
if speed > 0 {
	var inst = instance_create_layer(x,y,"Instances",obj_bullet_trail);
	inst.image_angle = direction;
};