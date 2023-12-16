image_alpha -= 1/room_speed*3;

if image_alpha <= 0 {
	instance_destroy();	
};

audio_emitter_position(emitter, x, y, 0);