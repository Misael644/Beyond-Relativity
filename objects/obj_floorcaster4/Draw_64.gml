draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(0,0,"FPS: "+string(fps));
draw_text(0,20,"InitialScale: "+string(InitialScale));
draw_text(0,40,"FinalScale: "+string(FinalScale));
//draw_text(0,60,"if "+string(scale-InitialScale)+" < "+string(FinalScale)+" {"+string(scale)+" += "+string(FinalScale)+"/"+string(room_height)+"};");
//if scale-InitialScale < FinalScale {scale += FinalScale/room_height};