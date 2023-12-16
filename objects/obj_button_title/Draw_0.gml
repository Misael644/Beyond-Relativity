//01/2021
//eu quero um switch
//07/07/2021
//haha lol pra que switch se eu vou ganhar um wii no meu aniversario

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_lime);
draw_set_font(fnt_title);
draw_set_alpha(obj_game.ShowHScoresAlpha);

if obj_game.ShowHScores == false {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, obj_game.ShowHScoresAlpha);

	draw_text(x,y,text);

	if obj_game.OptSelect == button {draw_sprite_ext(spr_ship, 0, x-100, y, image_xscale, image_yscale, image_angle, image_blend, obj_game.ShowHScoresAlpha)};
};
draw_set_alpha(1);