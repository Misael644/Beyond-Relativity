draw_self();

if DamageAlpha > 0 {
	var cr = c_red;
	draw_set_alpha(DamageAlpha);
	draw_rectangle_color(0,0,room_width,room_height,cr,cr,cr,cr,false);
	draw_set_alpha(1);
};

//if DebugMode == true {draw_text(x,y,string(RayTarget))};

if RaySize == 1 {
	draw_line_colour(x,y,x + lengthdir_x(room_width,image_angle),y + lengthdir_y(room_width,image_angle),c_red,c_red);
};