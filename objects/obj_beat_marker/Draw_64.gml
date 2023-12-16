draw_self();

draw_set_alpha(alpha);
gpu_set_fog(true,c_white,0,0);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,alpha);
gpu_set_fog(false,c_black,0,0);
draw_set_alpha(1);