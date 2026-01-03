class_name AttackComponent
extends Node


signal hit_direction(dir: Vector2)

enum AttackState {
	IDLE,
	ATTACKING,
}
@export var damage: int = 1
@export_group("Hit Areas")
@export var top_area: Area2D
@export var bottom_area: Area2D
@export var left_area: Area2D
@export var right_area: Area2D

var state: AttackState
var target_top: Node2D = null
var target_bottom: Node2D = null
var target_left: Node2D = null
var target_right: Node2D = null


func _ready() -> void:
	top_area.body_entered.connect(func(body: Node2D): target_top = body)
	top_area.body_exited.connect(func(_body: Node2D): if top_area.get_overlapping_bodies().is_empty(): target_top = null)
	
	bottom_area.body_entered.connect(func(body: Node2D): target_bottom = body)
	bottom_area.body_exited.connect(func(_body: Node2D): if bottom_area.get_overlapping_bodies().is_empty(): target_bottom = null)
	
	left_area.body_entered.connect(func(body: Node2D): target_left = body)
	left_area.body_exited.connect(func(_body: Node2D): if left_area.get_overlapping_bodies().is_empty(): target_left = null)
	
	right_area.body_entered.connect(func(body: Node2D): target_right = body)
	right_area.body_exited.connect(func(_body: Node2D): if right_area.get_overlapping_bodies().is_empty(): target_right = null)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"attack") and state == AttackState.IDLE:
		var hit: Node2D = null
		state = AttackState.ATTACKING
		if Input.is_action_pressed(&"up") and target_top:
			hit = target_top
			if hit: hit_direction.emit(Vector2.UP)
		
		if Input.is_action_pressed(&"down") and target_bottom:
			hit = target_bottom
			if hit: hit_direction.emit(Vector2.DOWN)
		
		if Input.is_action_pressed(&"left") and target_left:
			hit = target_left
			if hit: hit_direction.emit(Vector2.LEFT)
		
		if Input.is_action_pressed(&"right") and target_right:
			hit = target_right
			if hit: hit_direction.emit(Vector2.RIGHT)
		state = AttackState.IDLE
		
		if hit:
			hit.take_damage(damage)
