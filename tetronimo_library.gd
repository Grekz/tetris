class_name TetrominoLibrary
extends RefCounted

enum TetrominoType { I = 0, T = 1, O = 2, Z = 3, S = 4, L = 5, J = 6 }

static var DEFINITIONS: Dictionary[TetrominoType, TetrominoDef] = {
	TetrominoType.I: TetrominoDef.new("I", [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1)]),
	TetrominoType.T: TetrominoDef.new("T", [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]),
	TetrominoType.O: TetrominoDef.new("O", [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)], Vector2i(0, 0)),
	TetrominoType.Z: TetrominoDef.new("Z", [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(2, 1)]),
	TetrominoType.S: TetrominoDef.new("S", [Vector2i(1, 0), Vector2i(2, 0), Vector2i(0, 1), Vector2i(1, 1)]),
	TetrominoType.L: TetrominoDef.new("L", [Vector2i(2, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]),
	TetrominoType.J: TetrominoDef.new("J", [Vector2i(0, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]),
}


static func get_def(type: TetrominoType) -> TetrominoDef:
	return DEFINITIONS[type]
