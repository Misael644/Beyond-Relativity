///@description END
obj_ship.PreStop = false;
view_enabled = false;
obj_game.TimeStop = false;
audio_resume_sound(msc_song);
instance_destroy(obj_invertfx);

obj_ship.timeline_index = -1;
obj_ship.timeline_speed = -1;
obj_ship.timeline_running = 0;
obj_ship.timeline_position = -1;