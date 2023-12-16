/*if keyboard_check(vk_add){profun += 0.01};
if keyboard_check(vk_subtract){profun -= 0.01};

for(var z = 0 + profun; z < 100; z += 1){
	for(var xpos = 0; xpos < 640; xpos += 640/6){
		for(var ypos = 0; ypos < 480; ypos += 480/6){
			var xx = (mouse_x+xpos-320)/z+320;
			var yy = (mouse_y+ypos-240)/z+240;

			draw_point_color(xx,yy,c_red);
		};
	};
};

for(var z = 0; z < 100; z++){
	var xx = (mouse_x-320)/z+320;
	var yy = (mouse_y-240)/z+240;
		
	draw_point_color(xx,yy,c_red);
};