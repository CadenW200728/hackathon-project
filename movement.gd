extends CharacterBody2D

var direction_x: float
var direction_y: float
var speed := 50
var power: float
@export var jump_strength := 10
@export var gravity := 10
signal shoot(pos: Vector2, dir: Vector2)


 


	
func get_input():
	direction_x = Input.get_axis("left", "right")
	direction_y = Input.get_axis("up", "down")
	if Input.is_action_just_pressed("shoot") and $reloadTimer.time_left == 0:
		print("nice")
		shoot.emit(global_position, get_local_mouse_position().normalized())
		$reloadTimer.start()
		var tween = get_tree().create_tween()
		tween.tween_property($Marker, "scale", Vector2(0.4,0.4),0.2)
		tween.tween_property($Marker, "scale", Vector2(1.2,1.2),0.4)
	if Input.is_action_just_pressed("dash"):
		$dashTimer.start()
		speed = speed * 3
		velocity.x = direction_x * speed
		velocity.y = direction_y * speed
		
		

func apply_gravity(delta):
	velocity.y += gravity * delta
func _physics_process(delta: float) -> void:
	get_input()
	velocity.x = direction_x * speed
	velocity.y = direction_y * speed
	move_and_slide()
	if velocity.length() > 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1
	print(direction_x, " ", direction_y, " ", velocity)
	update_marker()

func _process(delta: float) -> void:	
	update_marker()
func update_marker():
	$Marker.position = get_local_mouse_position().normalized() * 110
	

	
#this is a test comment to push
#I need to test this please work
func _on_dash_timer_timeout() -> void:
	speed = 50
