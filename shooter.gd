extends Node2D


func _ready() -> void:
	$Button.pressed.connect(_on_item_pressed.bind("berry"))
	$Button2.pressed.connect(_on_item_pressed.bind("lenny"))
	$Button3.pressed.connect(_on_item_pressed.bind("mirror"))
	$Button4.pressed.connect(_on_item_pressed.bind("scaleOs"))
	$character/CharacterBody2D.shoot.connect(_on_character_body_2d_shoot)

func _on_item_pressed(item: String) -> void:
	Global1.selected_item = item
	print("Selected: ", item)
	
var bullet_scene = preload("res://bullet.tscn")



func _on_character_body_2d_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	$bullets.add_child(bullet)
	bullet.setup(pos, dir)
