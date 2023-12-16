draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
draw_set_alpha(alpha);
if instance_exists(obj_ship){draw_text_transformed(x,y,obj_ship.ItemText,sca,sca,0)};
draw_set_alpha(1);