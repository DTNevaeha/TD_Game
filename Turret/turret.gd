extends Node3D

@export var projectile: PackedScene

var enemy_path: Path3D

@onready var turret_top: MeshInstance3D = $TurretBase/TurretTop


func _physics_process(_delta: float) -> void:
    var enemy = enemy_path.get_children().back()
    look_at(enemy.global_position, Vector3.UP, true) # True uses the model front


func _on_timer_timeout() -> void:
    var shot = projectile.instantiate()
    add_child(shot)
    shot.global_position = turret_top.global_position
    shot.direction = global_transform.basis.z # Basis.z makes it so the turret fires in the direction the turret faces.
