//draw_self();

//(mouse_x+xpos-320)/z+320
//var z = (room_height/y)*ZLevel;
//draw_sprite_ext(spr_follow,0,(x-room_width/2)/z+room_width/2,(y-room_height/2)/z+room_height/2,y/(room_height/2),y/(room_height/2),0,c_white,1);
var z = (abs(y-room_height)/room_height)*obj_game.ZLevel;
var yTrans = (y-room_height/2)/z+room_height/2;
var scale = yTrans/(room_height/2);
draw_sprite_ext(spr_follow,0,(x-room_width/2)/z+room_width/2,yTrans,scale,scale,0,c_white,1);

//draw_text((x-room_width/2)/z+room_width/2,yTrans,scale);

if place == noone {
	draw_circle_color(x,y,rad,c_blue,c_blue,true);
} else {
	draw_line_color(x,y,place.x,place.y,c_blue,c_blue);	
};