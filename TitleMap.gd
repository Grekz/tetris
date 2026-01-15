extends TileMap

var i := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.I]
var t := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.T]
var o := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.O]
var z := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.Z]
var l := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.L]
var s := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.S]
var j := TetrominoLibrary.DEFINITIONS[TetrominoLibrary.TetrominoType.J]

var shapes := [i, t, o, z, s, l, j]
var shapes_full := shapes.duplicate()

const COLS = 10
const ROWS = 20

var directions := [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.DOWN]
var steps: Array
var steps_req := 50
var start_pos := Vector2i(5, 1)
var cur_pos: Vector2i
var speed: float
const ACCEL := 0.25

var piece_type: TetrominoDef
var next_piece_type: TetrominoDef
var rotation_index := 0
var active_piece: Array

var score := 0
var is_game_running := false
const REWARD := 100

var tile_id := 0
var piece_atlas: Vector2i
var next_piece_atlas: Vector2i

var board_layer := 0
var active_layer := 1


func draw_piece(piece, pos, atlas = 0):
	for i in piece:
		set_cell(active_layer, pos + i, tile_id, atlas)


func pick_piece():
	var piece
	if not shapes.is_empty():
		shapes.shuffle()
		piece = shapes.pop_front()
	return piece


func create_piece():
	steps = [0, 0, 0]
	cur_pos = start_pos
	active_piece = piece_type.blocks
	piece_atlas = Vector2i(1, 0)


func new_game():
	piece_type = pick_piece()
	create_piece()


func move_piece(dir):
	cur_pos += dir
	draw_piece(active_piece, cur_pos, piece_atlas)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	steps[2] += speed
	for i in range(steps.size()):
		if (steps[i] > steps_req):
			move_piece(directions[i])
			steps[i] = 0
