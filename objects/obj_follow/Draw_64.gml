if place == noone {
	rad++;
	collision_circle_list(x,y,rad,obj_place,false,true,ColList,true);
	
	for(var i = 0; i < ds_list_size(ColList); i++){
		var PlaceCheck = ds_list_find_value(ColList,i)
		if position_meeting(mouse_x,mouse_y,id) {
			//draw_line_color(x,y,PlaceCheck.x,PlaceCheck.y,c_blue,c_blue);
		};
		
		if ds_list_find_value(ColList,i).donor == noone {
			place = ds_list_find_value(ColList,i);
			ds_list_find_value(ColList,i).donor = id;
		};
	};
	
	with(obj_place){
		if donor != noone {
			if donor.place != id {donor = noone};
		};
	};
} else {
	//draw_text(x,y,string(x-place.x)+"\n"+string(y-place.y));
	
	var FricLevel = 0.5;
	if abs(x-place.x) < FricLevel && abs(y-place.y) < FricLevel {
		//fric++;
		halt = true;
		speed = 0;
	};
	if position_meeting(mouse_x,mouse_y,id){
		draw_text(x+20,y,string(abs(x-place.x))+"\n"+string(abs(y-place.y)));	
	};
};

//draw_text(x,y,fric);