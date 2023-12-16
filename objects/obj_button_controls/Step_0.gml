switch(button){
    case "turnl":
        sprite_index = spr_button_control_turnl;
        key=virtual_key_add(x, y, 64, 64, vk_left);
        break;
        
    case "turnr":
        sprite_index = spr_button_control_turnr;
        key=virtual_key_add(x, y, 64, 64, vk_right);
        break;

    case "fwd":
        sprite_index = spr_button_control_fwd;
        key=virtual_key_add(x, y, 64, 64, vk_up);
        break;

    case "shoot":
        sprite_index = spr_button_control_shoot;
        key=virtual_key_add(x, y, 64, 64, vk_space);
        break;
};

switch(button){
    case "turnl":
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_turnl_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_turnl};
        break;
        
    case "turnr":
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_turnr_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_turnr};
        break;
 
    case "fwd":
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_fwd_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_fwd};
        break;
            
	case "shoot":
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_shoot_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){sprite_index = spr_button_control_shoot};  
        break;
};