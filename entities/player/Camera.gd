extends Camera2D

enum TargetMode{target_point, target_node}

export (TargetMode) var target_mode

var target_node

func _process(delta):
	match target_mode:
		'target_node':
			if is_instance_valid(target_node):
				global_position = target_node.global_position
