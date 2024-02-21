extends CanvasLayer

func _on_ObjectiveArea_body_entered_show_message(body: RigidBody2D):
	if (body.name == "BlueShip"):
		if (get_tree().current_scene.name == "MainLevel"):
			$WinMessage.show()
		elif (get_tree().current_scene.name == "SecondLevel"):
			$EndMessage.show()
		

