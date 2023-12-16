///@description Stop time!
view_enabled = false;
obj_game.TimeStop = true;

if PowerUp == "timestop" {
	obj_ship.PreStop = false;
	audio_play_sound_on(emitter,snd_item_timestop_toki,false,1);
	obj_game.secon = current_second;
	instance_create_layer(room_width/2,room_height/2,"Instances",obj_clock);
	instance_create_layer(room_width/2,room_height/2,"Instances",obj_invertfx);
} else if PowerUp == "backtime" {
	parasite = true;
	obj_ship.timeline_index = -1;
	obj_ship.timeline_speed = -1;
	obj_ship.timeline_running = 0;
	obj_ship.timeline_position = -1;
};