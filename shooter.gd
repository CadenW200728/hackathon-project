extends Node2D
var bullet_scene = preload("res://bullet.tscn")

func _on_character_body_2d_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	print(pos)
	print(dir)
	$bullets.add_child(bullet)
	bullet.setup(pos, dir)
