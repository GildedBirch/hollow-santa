class_name AttackComponent
extends Node


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


func _unhandled_key_input(event: InputEvent) -> void:
	var hits: Array = []
	if event.is_action_pressed(&"attack"):
		if Input.is_action_pressed(&"up"):
			hits = top_area.get_overlapping_bodies()
		if Input.is_action_pressed(&"down"):
			hits = bottom_area.get_overlapping_bodies()
		if Input.is_action_pressed(&"left"):
			hits = left_area.get_overlapping_bodies()
		if Input.is_action_pressed(&"right"):
			hits = right_area.get_overlapping_bodies()
