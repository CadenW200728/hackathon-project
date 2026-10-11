extends Node2D


func _ready() -> void:
	$CanvasLayer/Button.pressed.connect(_on_item_pressed.bind("berry"))
	$CanvasLayer/Button2.pressed.connect(_on_item_pressed.bind("lenny"))
	$CanvasLayer/Button3.pressed.connect(_on_item_pressed.bind("mirror"))
	$CanvasLayer/Button4.pressed.connect(_on_item_pressed.bind("scaleOs"))
	$character/CharacterBody2D.shoot.connect(_on_character_body_2d_shoot)

func _on_item_pressed(item: String) -> void:
	Global1.selected_item = item
	print("Selected: ", item)
	
var bullet_scene = preload("res://bullet.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("select_berry"):
		_on_item_pressed("berry")
	elif event.is_action_pressed("select_lenny"):
		_on_item_pressed("lenny")
	elif event.is_action_pressed("select_mirror"):
		_on_item_pressed("mirror")
	elif event.is_action_pressed("select_scaleOs"):
		_on_item_pressed("scaleOs")
		
func _on_character_body_2d_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	$bullets.add_child(bullet)
	bullet.setup(pos, dir)
