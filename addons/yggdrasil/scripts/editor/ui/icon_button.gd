@tool
extends Button

@export var icon_name: String = "Node":
	set(value):
		icon_name = value
		_update_icon()

const theme_name: StringName = &"EditorIcons"

func _enter_tree():
	_update_icon()

func _update_icon():
	if has_theme_icon(icon_name, theme_name):
		icon = get_theme_icon(icon_name, theme_name)
	else:
		icon = null
