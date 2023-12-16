draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_font(fnt_text);

draw_text(0, 0,string_hash_to_newline(string(ArrayList) + ": " + string(yPos[ArrayList]))); //draw an array value
draw_text(0, 20,string_hash_to_newline("Count: " +string(Count)));
draw_text(0, 40,string_hash_to_newline("Y position: " +string(yPos)));
draw_text(0, 60,string_hash_to_newline("ArrayList: " +string(ArrayList)));
if Count > 0 {
draw_text(0, 80,string_hash_to_newline("Last y pos: " +string(yPos[Count-1])));
draw_text(0, 100,string_hash_to_newline("Actual y pos: " +string(yPos[Count])));
}

/*if count > 0 {
    draw_line_colour(640+xpos[count]-32,(room_height/2)-(array[count-1]*10),640+xpos[count],(room_height/2)-(array[count]*10),c_lime,c_lime);
};

/* */
/*  */
