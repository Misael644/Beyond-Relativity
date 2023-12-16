move_wrap(true,true,sprite_width/2);

if obj_game.GamePause == false {
	if obj_game.TimeStop == false {
		image_angle = image_angle + 1;
		speed = 1;
	} else {
		speed = 0;	
	};
} else {
	speed = 0;
};

if room == rm_test {speed = 0};

if sprite_index = spr_asteroid_giant {speed = 0};