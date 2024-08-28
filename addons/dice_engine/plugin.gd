@tool
extends EditorPlugin


const PATH_DICE_ENGINE: String = "res://addons/dice_engine/dice_engine.gd"


func _enter_tree():
	add_autoload_singleton("Dice", PATH_DICE_ENGINE)


func _exit_tree():
	remove_autoload_singleton("Dice")
