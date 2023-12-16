//draw_surface_ext(sprite,0,0,1,1,0,c_white,1);

var BcgY = room_height/2;

draw_sprite_ext(background,0,room_width/2,BcgY,scale,scale,0,c_white,1);

if !surface_exists(SingleLine){
	SingleLine = surface_create(room_width,1);
	surf = surface_create(room_width,room_height);
};

//for(lineY = 0; lineY < room_height; lineY++){
	if scale-InitialScale < FinalScale {scale += FinalScale/room_height};
	
	if lineY < room_height {lineY++};
	
	surface_set_target(SingleLine);
		var cb = c_black;
		draw_rectangle_color(0,0,room_width,room_height,cb,cb,cb,cb,false);
		
		draw_sprite_ext(background,0,room_width/2,BcgY-lineY,scale,scale,0,c_white,1);
	surface_reset_target();

	surface_set_target(surf);
	if scale >= 0 {draw_surface(SingleLine,0,lineY)};
	surface_reset_target();
	
	draw_text(0,lineY,scale);
//};

draw_surface_ext(surf,0,0,1,1,0,c_white,1);

draw_line_color(0,lineY,room_width,lineY,c_red,c_red);

var BcgSpeed = 1*(60/fps)

if keyboard_check(vk_up){yy -= BcgSpeed};
if keyboard_check(vk_down){yy += BcgSpeed};
if keyboard_check(vk_left){xx -= BcgSpeed};
if keyboard_check(vk_right){xx += BcgSpeed};

sprite_set_offset(background,xx,yy);

if keyboard_check(189){InitialScale -= 0.1};
if keyboard_check(187){InitialScale += 0.1};

if keyboard_check(219){FinalScale -= 0.1};
if keyboard_check(221){FinalScale += 0.1};