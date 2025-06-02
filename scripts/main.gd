extends Node2D
@onready var core = $Core

var foeScene = load("res://foe.tscn")
var defBlobScene = load("res://defense_blob.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var LMBtnPressed : bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("LMButton"):
		LMBtnPressed = true
		print("LMBPress")
		
	if event.is_action_released("LMButton"):
		LMBtnPressed = false
		print("LMBRelease")

	if LMBtnPressed:
		var instance = defBlobScene.instantiate()
		
		add_child(instance)
		#instance.add_to_group("dude")
		#print(dude)
		instance.global_position = get_global_mouse_position()




func ranSpawn(radius: float) -> Vector2:
	var angle = randf() * TAU  
	var x = cos(angle) * radius + core.global_position.x
	var y = sin(angle) * radius + core.global_position.y
	return Vector2(x, y)


func _on_foe_spawn_timer_timeout() -> void:
	var spawnCoords = ranSpawn(1000)
	var instFoe = foeScene.instantiate()
	add_child(instFoe)
	instFoe.global_position = spawnCoords
	print("new opp spawned")
