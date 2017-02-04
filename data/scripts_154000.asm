	dw Data_154004
	dw Data_154011

Data_154004:
	script_spawn_player $5, $3
	script_spawn_partner $4, $3
	script_walk_player $55, $20
	script_walk_partner $45, $20
	script_wait_player_walk
	script_antenna_tree_map_name
	script_end

Data_154011:
	script_spawn_player $4, $3
	script_spawn_partner $5, $3
	script_walk_player $45, $20
	script_walk_partner $55, $20
	script_wait_player_walk
	script_antenna_tree_map_name
	script_end
