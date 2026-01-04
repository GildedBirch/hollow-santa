class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var attack_component: AttackComponent = %AttackComponent
@onready var sprite: AnimatedSprite2D = %Sprite


func _ready() -> void:
	attack_component.hit_direction.connect(_on_body_hit)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x =+ direction * SPEED
		sprite.animation = &"Move"
		sprite.flip_h = true if direction < 0 else false
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
		sprite.animation = &"Idle"

	move_and_slide()


func _on_body_hit(dir: Vector2) -> void:
	velocity = -dir * 450.0
