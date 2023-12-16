HourAngle = -((360/12)*hours+30*(minutes/60));
MinAngle = -((360/60)*minutes+6*(seconds/60));
SecAngle = -((360/60)*seconds);

draw_sprite_ext(bcg_clock,0,room_width/2,room_height/2,1,1,0,c_white,0.5);
draw_sprite_ext(spr_clock_hour,0,room_width/2,room_height/2,1,1,HourAngle,c_white,0.5);
draw_sprite_ext(spr_clock_min,0,room_width/2,room_height/2,1,1,MinAngle,c_white,0.5);
draw_sprite_ext(spr_clock_sec,0,room_width/2,room_height/2,1,1,SecAngle,c_white,0.5);