@tool
class_name YggdrasilMainScreen
extends Control

const Yggdrasil = preload("res://addons/yggdrasil/scripts/shared/yggdrasil.gd")

signal dirty_changed(editor: YggdrasilEditor, dirty: bool)
signal tree_closed(editor: YggdrasilEditor)

@export var tab_container: TabContainer
@export var browser: YggdrasilBrowser
@export var editor_scene: PackedScene
@export var save_confirmation: ConfirmationDialog

@export_group("Shortcuts")
@export var undo_shortcut: Shortcut
@export var redo_shortcut: Shortcut

var initialized = false

var _open_editors: Array[YggdrasilEditor] = []

func init():
	initialized = true
	browser.init()
	
	tab_container.set_tab_title(0, "")
	tab_container.set_tab_icon(0, get_theme_icon("Add", Yggdrasil.ICON_THEME))
	tab_container.tab_button_pressed.connect(_on_tab_button_pressed)
	
	save_confirmation.add_button("Don't Save", true, "no_save")
	save_confirmation.custom_action.connect(_dont_save)
	save_confirmation.confirmed.connect(_confirm_save)

func open_tree(path: String):
	var tree_resource = YggdrasilLoader.load_tree(path)

	for i in range(_open_editors.size()):
		var open_editor = _open_editors[i]
		if open_editor.tree.resource_path == path:
			tab_container.current_tab = i
			return

	var editor: YggdrasilEditor = editor_scene.instantiate()
	editor.name = tree_resource.name
	tab_container.add_child(editor)

	var editor_index = tab_container.get_tab_count() - 2
	tab_container.move_child(editor, editor_index)
	tab_container.set_tab_title(editor_index, tree_resource.name)
	tab_container.set_tab_button_icon(editor_index, get_theme_icon("Close", Yggdrasil.ICON_THEME))
	
	editor.init()
	editor.tree_closed.connect(_on_tree_closed)
	editor.edit_tree(path)
	editor.dirty_changed.connect(_on_tree_dirty_changed)

	tab_container.current_tab = editor_index
	_open_editors.append(editor)

func _shortcut_input(event):
	if not is_visible_in_tree():
		return
	
	if not event.pressed or event.is_echo():
		return
	
	if undo_shortcut.matches_event(event):
		get_viewport().set_input_as_handled()
	elif redo_shortcut.matches_event(event):
		get_viewport().set_input_as_handled()

func _on_tree_closed(editor: YggdrasilEditor):
	_open_editors.erase(editor)
	tree_closed.emit(editor)
	editor.queue_free()

func _on_tree_dirty_changed(editor: YggdrasilEditor, dirty: bool):
	var index = editor.get_index()
	if dirty:
		tab_container.set_tab_title(index, "%s(*)" % editor.tree.name)
	else:
		tab_container.set_tab_title(index, editor.tree.name)
	dirty_changed.emit(editor, dirty)

func _on_tab_button_pressed(tab_index: int):
	var editor: YggdrasilEditor = tab_container.get_child(tab_index)
	_show_close_confirmation(editor)

func _show_close_confirmation(editor: YggdrasilEditor):
	if editor.dirty:
		save_confirmation.dialog_text = "Tree \"%s\" has unsaved changes.\nLast saved: %s\n\nSave before closing?" % [editor.tree.name, editor.get_last_modified_time()]
		save_confirmation.popup_centered()
		save_confirmation.set_meta("editor", editor)
	else:
		editor.close_tree()

func _confirm_save():
	var editor: YggdrasilEditor = save_confirmation.get_meta("editor")
	ResourceSaver.save(editor.tree, editor.tree.resource_path)
	EditorInterface.get_resource_filesystem().scan()
	editor.close_tree()

func _dont_save(_action: String):
	var editor: YggdrasilEditor = save_confirmation.get_meta("editor")
	editor.close_tree()
	save_confirmation.hide()
