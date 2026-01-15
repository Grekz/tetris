class_name TetrominoDef
extends RefCounted

@export var name: String
@export var pivot: Vector2i
@export var blocks: Array[Vector2i]

const DEFAULT_PIVOT = Vector2i(1, 1)


func _init(_name: String, _blocks: Array[Vector2i], _pivot: Vector2i = DEFAULT_PIVOT):
	name = _name
	blocks = _blocks
	pivot = _pivot
