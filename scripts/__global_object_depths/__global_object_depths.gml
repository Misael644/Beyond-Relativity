function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_ship
	global.__objectDepths[1] = -5; // obj_ship_trail
	global.__objectDepths[2] = -10; // obj_asteroid
	global.__objectDepths[3] = 0; // obj_ghost
	global.__objectDepths[4] = -20; // obj_bullet
	global.__objectDepths[5] = -25; // obj_bullet_trail
	global.__objectDepths[6] = -5; // obj_debris_r
	global.__objectDepths[7] = -5; // obj_debris_o
	global.__objectDepths[8] = -5; // obj_debris_y
	global.__objectDepths[9] = 10; // obj_logo
	global.__objectDepths[10] = -100; // obj_game
	global.__objectDepths[11] = -90; // obj_gamelogo
	global.__objectDepths[12] = 90; // obj_starcreator
	global.__objectDepths[13] = 120; // obj_star
	global.__objectDepths[14] = -80; // obj_button_title
	global.__objectDepths[15] = -80; // obj_button_controls
	global.__objectDepths[16] = -80; // obj_button_gameover
	global.__objectDepths[17] = -80; // obj_button_back
	global.__objectDepths[18] = 110; // obj_bcg1_3
	global.__objectDepths[19] = 109; // obj_bcg_solar_1
	global.__objectDepths[20] = 110; // obj_bcg_solar_2
	global.__objectDepths[21] = 109; // obj_bcg_bhole_1
	global.__objectDepths[22] = 110; // obj_bcg_bhole_2
	global.__objectDepths[23] = 0; // obj_matrix
	global.__objectDepths[24] = 0; // obj_ship_random
	global.__objectDepths[25] = 0; // obj_game_new


	global.__objectNames[0] = "obj_ship";
	global.__objectNames[1] = "obj_ship_trail";
	global.__objectNames[2] = "obj_asteroid";
	global.__objectNames[3] = "obj_ghost";
	global.__objectNames[4] = "obj_bullet";
	global.__objectNames[5] = "obj_bullet_trail";
	global.__objectNames[6] = "obj_debris_r";
	global.__objectNames[7] = "obj_debris_o";
	global.__objectNames[8] = "obj_debris_y";
	global.__objectNames[9] = "obj_logo";
	global.__objectNames[10] = "obj_game";
	global.__objectNames[11] = "obj_gamelogo";
	global.__objectNames[12] = "obj_starcreator";
	global.__objectNames[13] = "obj_star";
	global.__objectNames[14] = "obj_button_title";
	global.__objectNames[15] = "obj_button_controls";
	global.__objectNames[16] = "obj_button_gameover";
	global.__objectNames[17] = "obj_button_back";
	global.__objectNames[18] = "obj_bcg1_3";
	global.__objectNames[19] = "obj_bcg_solar_1";
	global.__objectNames[20] = "obj_bcg_solar_2";
	global.__objectNames[21] = "obj_bcg_bhole_1";
	global.__objectNames[22] = "obj_bcg_bhole_2";
	global.__objectNames[23] = "obj_matrix";
	global.__objectNames[24] = "obj_ship_random";
	global.__objectNames[25] = "obj_game_new";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
