extends KinematicBody2D

export (int) var speed = 1000

var target = Vector2()
var velocity = Vector2()
var inspected_rect = Rect2(240, 80, 1130, 1720)

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		if $FactionArt.region_rect.size.y < inspected_rect.size.y:
			$FactionArt.region_rect.size.y += 100
			$FactionArt.z_index = 100
			$"../FactionButton".set_visible(false)

func _on_FactionButton_button_down():
	target = Vector2(240, 80)
