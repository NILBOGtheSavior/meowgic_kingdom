class_name CombatStage
extends Node2D

@export_category("Enemy Settings")

enum EnemyClass { NONE, GUARD, MAGE, NECROMANCER }

@export var enemies: Array[EnemyClass] = [
	EnemyClass.GUARD
]

@export_range(0, 1000, 1) var level = 1

func _ready():
	for enemy in enemies:
		print(enemy)
	
