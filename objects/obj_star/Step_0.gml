if room == rm_start {
	image_xscale = speed;
	image_yscale = image_xscale;
	image_alpha += 0.05;
	speed += 0.0005

	direction = point_direction(obj_starcreator.x,obj_starcreator.y,x,y);
};