if LeftRight == "left"{
   image_angle = image_angle + 5;
} else if LeftRight == "right"{
    image_angle = image_angle - 5;
};

if Up == "up"{
    motion_add(image_angle, 0.05);
};

move_wrap(true,true,sprite_width/2);

/*if(keyboard_check_pressed(ord('1'))){
    line = true ;}
else if keyboard_check_pressed(ord('2')){
    line = false;}
    

if(keyboard_check_pressed(ord('0'))){speed = 0};
*/

/* */
/*  */
