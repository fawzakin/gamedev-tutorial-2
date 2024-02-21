extends Node2D

export var speed = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Platform initialized")
	print(get_tree().current_scene.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up"):
		move_local_y(-speed * delta)
	
	if Input.is_action_pressed("move_down"):
		move_local_y(speed * delta)
	
	if Input.is_action_pressed("ui_restart"):
		print("Restart Level")
		print(get_tree().get_current_scene())
		get_tree().reload_current_scene()
