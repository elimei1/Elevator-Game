extends CharacterBody2D
class_name NPC

@export var speed: float = 150.0	
# Pixel-Breite der vollen Bar
@export var max_patience: float = 32.0
# Rate in Pixel pro Sekunde (je kleiner, desto langsamer schrumpft die Bar)
@export var patience_loss_rate: float = 1.5


# how quickly we ramp up/down in px/s²
@export var acceleration: float = 500.0
@export var deceleration: float = 500.0
# interne State-Variablen
var patience: float
var in_elevator: bool = false
var can_move: bool = true
var target_floor_index: int
var target_y: float
var has_left: bool = false   


# Referenzen
@onready var anim = $AnimatedSprite2D
@onready var bar  = $PatienceBar
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	anim.play("default")
	var target_y_values = [550, 350, 150] 
	target_y = target_y_values[target_floor_index]  
	bar.min_value = 0 
	bar.max_value = max_patience
	bar.step = 3
	patience = max_patience
	bar.value = patience
	

func _physics_process(delta):
	var label = get_tree().get_first_node_in_group("label")
	var text = "Lives left: "
	var whole_text = str(text, str(Global.points))
	label.text = whole_text
	patience -= patience_loss_rate * delta
	if patience<0:
		patience = 0
	bar.value = patience
#	var target_speed_x: float = 0.0
	if patience == 0 and has_left == false:
		anim.play("death")
		Global.points -= 1
		if Global.points <= 0:
			print("Game over")
		queue_free()
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	
	if not in_elevator:
#		target_speed_x = -speed
		velocity.x = -speed

	elif in_elevator:
		if abs(global_position.y - target_y) < 20.0:
			if not has_left:
				has_left = true
				bar.visible = false
			anim.play("walkRight")
#			target_speed_x = speed
			velocity.x = speed  


	move_and_slide()
