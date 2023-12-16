state = "creating";
target = noone;

if obj_ship.Lasers == 3 {hp = 2} else if obj_ship.Lasers < 3 {hp = 1};

emitter = audio_emitter_create();
audio_listener_orientation(0, 1, 0, 0, 0, 1);
audio_listener_position(room_width/2, room_height/2, 0);