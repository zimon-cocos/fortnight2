extends CharacterBody2D

@onready var core = get_parent().get_node("Core")
const SPEED = 200.0



func _physics_process(delta: float) -> void:
	#if rotation_degrees<90:
	#	rotation_degrees += 1 
	#	print(rotation)
	look_at(core.global_position)
	rotation_degrees += 90
	if global_position.distance_to(core.global_position) > 50: #vzdialenost kedy foe zastane
		velocity = global_position.direction_to(core.global_position) * SPEED
		move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Collided")
	queue_free()
	Global.score += 1
	print(Global.score)
