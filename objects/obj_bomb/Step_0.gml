if obj_game.GamePause == true {
	speed = 0;
	alarm[0] += 1;
} else {
	if obj_game.TimeStop == true {
		speed = 0;
		alarm[0] += 1;
	} else {
		speed = 3;
	};
};

audio_emitter_position(emitter, x, y, 0);