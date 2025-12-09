extends RigidBody2D

@export var mass_kg: float = 10.0

var _dragging := false

func _ready() -> void:
    input_pickable = true
    mass = mass_kg

func _input_event(viewport, event, shape_idx) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        _start_drag()

func _input(event) -> void:
    if _dragging and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
        _stop_drag()

func _process(delta: float) -> void:
    if _dragging:
        global_position = get_global_mouse_position()

func _start_drag() -> void:
    _dragging = true
    freeze = true
    linear_velocity = Vector2.ZERO
    angular_velocity = 0.0

func _stop_drag() -> void:
    _dragging = false
    freeze = false

func get_data() -> String:
    return "Mass: %0.2f kg" % mass_kg
