ClickCount = 0;

LastSpeed = 0;
Lasers = 1;
spd = 0.05;
ItemText = "";
NoCollide = false;
DamageAlpha = 0;
PreStop = false;
RaySize = 0;
ray = noone;
RayTarget = noone;
PowerUp = "";
parasite = false;
ParasiteX = room_width/2;
ParasiteY = room_height/2;
BombHost = noone;

emitter = audio_emitter_create();
audio_listener_orientation(0, 1, 0, 0, 0, 1);
audio_listener_position(room_width/2, room_height/2, 0);

obj_ship.timeline_index = -1;
obj_ship.timeline_speed = -1;
obj_ship.timeline_running = 0;
obj_ship.timeline_position = -1;

OldX = x;
OldY = y;

/*camera_set_view_size(view_camera[0], 320, 240);
camera_set_view_border(view_camera[0], 160, 160);
camera_set_view_target(view_camera[0], id);
view_enabled = true;
view_visible[0] = true;