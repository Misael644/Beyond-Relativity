draw_set_font(fnt_arial);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if obj_game.ShowHScores == false {
	//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, obj_game.ShowHScoresAlpha);
	image_alpha = obj_game.ShowHScoresAlpha;
	
	var cw = c_white;
	draw_text_color(495, 183, "v1.2b", cw,cw,cw,cw, obj_game.ShowHScoresAlpha);
} else {
	image_alpha = 0;	
};