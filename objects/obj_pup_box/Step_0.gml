image_blend = make_color_hsv(color,255,255);
if color == 256 {color = 1};

if obj_game.GamePause == false {
	if obj_game.TimeStop == false {
		color += 1;
		speed = 1;
		image_speed = 1;
	} else {
		speed = 0;
		image_speed = 0;
	};
} else {
	speed = 0;
	image_speed = 0;
};