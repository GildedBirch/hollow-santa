class_name Wreath
extends StaticBody2D


@onready var sprite: AnimatedSprite2D = %Sprite
@onready var gpu_particles_2d: GPUParticles2D = %GPUParticles2D


func take_damage(_damage: int) -> void:
	sprite.play(&"default")
	gpu_particles_2d.restart()
