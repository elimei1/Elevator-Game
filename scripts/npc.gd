extends CharacterBody2D
class_name NPC

@export var speed: float = 200.0
@export var max_patience: float = 32.0
@export var patience_loss_rate: float = 3

var patience: float
var in_elevator: bool = false
var can_move: bool = true

@onready var anim = $AnimatedSprite2D
@onready var bar  = $PatienceBar
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
  var target_y_values = [550, 350, 150] 
	target_y = target_y_values[target_floor_index]  
	# Patience-Bar initialisieren
	bar.min_value = 0
	bar.max_value = max_patience
	bar.step     = 3
	patience     = max_patience
	bar.value    = patience

	# Starte mit Idle-Animation
	anim.play("idle")

func _physics_process(delta):
	# 1) Geduld konstant abbauen
	patience = patience - patience_loss_rate * delta
	if patience < 0:
		patience = 0
	bar.value = patience

	# 2) Wenn Geduld aufgebraucht → nach rechts zurücklaufen
	if patience <= 0:
		queue_free()
		return

	# 3) Wenn im Aufzug oder beim Warten → idle
	if in_elevator or not can_move:
		velocity.x = 0
		velocity.y = 0
		anim.play("idle")
		return

	# 4) Normal links laufen
	velocity.x = -speed
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y = velocity.y + gravity * delta