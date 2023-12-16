///@description And time continues to flow.
audio_play_sound_on(emitter,snd_item_timestop_soshite,false,1);
camera_set_view_size(view_camera[0], 320, 240);
camera_set_view_border(view_camera[0], 160, 160);
camera_set_view_target(view_camera[0], id);
view_enabled = true;
view_visible[0] = true;
obj_ship.PreStop = true;
instance_destroy(obj_clock);