if !surface_exists(SingleLine){SingleLine = surface_create(640,1)};
if !surface_exists(render){render = surface_create(640,480)};

if scale-InitialScale < FinalScale {scale += FinalScale/room_height};

surface_set_target(SingleLine);
draw_surface_ext(application_surface,room_width/2,room_height/2-LineY,scale,scale,0,c_white,1);
//draw_sprite_ext(background,0,room_width/2,BcgY-LineY,scale,scale,0,c_white,1);
draw_surface(application_surface,0,-LineY);
surface_reset_target();

surface_set_target(render);
draw_surface_ext(SingleLine,0,LineY,LineY/480,LineY/480,0,c_white,1);

if LineY == 0 {draw_clear_alpha(c_black,0)};
surface_reset_target();

draw_surface_ext(render,0,0,1,1,0,c_white,1);