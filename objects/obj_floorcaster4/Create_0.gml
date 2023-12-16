background = bcg_level;

InitialScale = 1;
FinalScale = 4;

scale = InitialScale;
lineY = 0;

SingleLine = surface_create(room_width,1);
surf = surface_create(room_width,room_height);

background2 = surface_create(room_width,room_height);

surface_set_target(background2);
	var cw = c_white;
	var cb = c_black;
	draw_rectangle_color(0,0,room_width,room_height,cw,cw,cw,cw,false);
	for(var i = 0; i < room_height; i++){
		var rep = 5;
		if i/rep == floor(i/rep) {
			draw_line_color(0,i,room_width,i,cb,cb);
		};
	};
surface_reset_target();

backg_spr = sprite_create_from_surface(background2,0,0,room_width,room_height,false,false,320,240);

xx = sprite_get_width(backg_spr)/4;
yy = sprite_get_height(backg_spr)/2;