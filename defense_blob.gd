extends StaticBody2D

@onready var animatedFire = $Area2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animatedFire.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_despawn_timer_timeout() -> void:
	queue_free()
