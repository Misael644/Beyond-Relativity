with (obj_button_controls) {
switch(buttonid)
{
    case 0:
        sprite_index = spr_button_turnl;
        key=virtual_key_add(x, y, 64, 64, vk_left);
        break;
        
    case 1:
        sprite_index = spr_button_turnr;
        key=virtual_key_add(x, y, 64, 64, vk_right);
        break;

    case 2:
        sprite_index = spr_button_fwd;
        key=virtual_key_add(x, y, 64, 64, vk_up);
        break;

    case 3:
        sprite_index = spr_button_shoot;
        key=virtual_key_add(x, y, 64, 64, vk_space);
        break;
}

switch(buttonid)
{
    case 0:
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_turnl_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_turnl};
            break;
        
    case 1:
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_turnr_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_turnr};
            break;
            
    case 3:
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_shoot_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_shoot};  
            break;
 
    case 2:
        if mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_fwd_pressed};
        if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id){
            sprite_index = spr_button_fwd};
            break;
            

}

}
