extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		if (get_tree().current_scene.name == "MainLevel"):
			yield(get_tree().create_timer(3), "timeout")
			get_tree().change_scene("res://scenes/SecondLevel.tscn")
