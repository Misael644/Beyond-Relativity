if NoCollide == false {
	if other.sprite_index == spr_asteroid_small {
		obj_game.hp -= 25;
		other.direction = point_direction(x,y,other.x,other.y);
	} else if other.sprite_index == spr_asteroid_med {
		obj_game.hp -= 50;
		DamageAlpha = 0.5;
	} else if other.sprite_index == spr_asteroid_huge {
		obj_game.hp -= 75;
		DamageAlpha = 1;
	};
	NoCollide = true;
	alarm[0] = 120;
	alarm[1] = 1;
	direction = point_direction(other.x,other.y,x,y);
	image_angle = point_direction(other.x,other.y,x,y);
	speed = 1;
	audio_play_sound_on(emitter,snd_damage,false,1);
};

if obj_game.hp <= 0 {
	lives -= 1;

	with(obj_game){
	    alarm[1] = room_speed;
	};

	audio_play_sound_on(emitter, snd_explosion, false, 1);

	instance_destroy();

	repeat(obj_game.BoomRepeat){
	    instance_create_layer(x,y,"Instances",obj_debris);
	};
};

if timeline_position < 120 {
	timeline_running = false;
	if audio_is_playing(snd_item_timestop_zawarudo){audio_stop_sound(snd_item_timestop_zawarudo)};
	view_enabled = false;
	PreStop = false;
	audio_resume_sound(msc_song);
};