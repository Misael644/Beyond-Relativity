///@description The World!
obj_ship.PreStop = true;
camera_set_view_size(view_camera[0], 320, 240);
camera_set_view_border(view_camera[0], 160, 160);
camera_set_view_target(view_camera[0], id);
view_enabled = true;
view_visible[0] = true;

audio_pause_sound(msc_song);

if PowerUp == "timestop" {
	audio_play_sound_on(emitter,snd_item_timestop_zawarudo,false,1);
} else if PowerUp == "backtime" {
	audio_play_sound_on(emitter,snd_item_backtime,false,1);
};