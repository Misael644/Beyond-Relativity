if instance_exists(obj_ship){
	gpu_set_blendmode_ext(bm_inv_dest_colour, bm_zero);
	draw_circle_color(obj_ship.x,obj_ship.y,radius,c_white,c_white,false);
	gpu_set_blendmode(bm_normal);
};

if radius < 840 {radius += 10};

depth = 760;