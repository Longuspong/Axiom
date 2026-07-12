class_name VirtualJoystick
extends Control
## Virtueller Touch-Joystick (Control). Gibt eine analoge Richtung (-1..1) aus;
## der Controller sampelt sie und schrittet den Grid-Cursor zellenweise.
## Funktioniert mit echtem Touch UND (per Maus-Emulation) mit der Maus.
## Bewusst single-pointer-tauglich gehalten — Multitouch ist späterer Feinschliff.

@export var radius := 90.0
@export var knob_radius := 38.0

var direction := Vector2.ZERO
var _active := false
var _touch_index := -1
var _knob := Vector2.ZERO

func _ready() -> void:
	custom_minimum_size = Vector2(radius * 2.0, radius * 2.0)
	size = custom_minimum_size
	focus_mode = Control.FOCUS_NONE
	_knob = _center()

func _center() -> Vector2:
	return Vector2(radius, radius)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and not _active:
			_active = true
			_touch_index = event.index
			_update(event.position)
		elif not event.pressed and event.index == _touch_index:
			_reset()
	elif event is InputEventScreenDrag and _active and event.index == _touch_index:
		_update(event.position)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_active = true
			_touch_index = -99
			_update(event.position)
		elif _touch_index == -99:
			_reset()
	elif event is InputEventMouseMotion and _active and _touch_index == -99:
		_update(event.position)

func _update(local_pos: Vector2) -> void:
	var c := _center()
	var off := local_pos - c
	if off.length() > radius:
		off = off.normalized() * radius
	_knob = c + off
	direction = off / radius
	queue_redraw()

func _reset() -> void:
	_active = false
	_touch_index = -1
	direction = Vector2.ZERO
	_knob = _center()
	queue_redraw()

func _draw() -> void:
	var c := _center()
	draw_circle(c, radius, Color(1, 1, 1, 0.10))
	draw_arc(c, radius, 0.0, TAU, 48, Color(1, 1, 1, 0.35), 2.0, true)
	draw_circle(_knob, knob_radius, Color(0.4, 0.6, 0.95, 0.55))
	draw_arc(_knob, knob_radius, 0.0, TAU, 32, Color(1, 1, 1, 0.5), 2.0, true)
