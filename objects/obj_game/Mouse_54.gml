if SpawnMode == true {
	var inst = instance_create_layer(mouse_x,mouse_y,"Instances",SpawnObj);
	if instance_exists(obj_ship){inst.direction = point_direction(mouse_x,mouse_y,obj_ship.x,obj_ship.y)};
	obj_ship.ClickCount += 1;
	cheated = true;
};