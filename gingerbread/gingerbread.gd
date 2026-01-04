class_name Gingerbread
extends Area2D


@onready var sprite: AnimatedSprite2D = %Sprite


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	sprite.frame = randi_range(0, sprite.sprite_frames.get_frame_count(&"default"))
	


func _on_body_entered(_body: Node2D) -> void:
	SignalBus.player.points_gained.emit(1)
	queue_free()
