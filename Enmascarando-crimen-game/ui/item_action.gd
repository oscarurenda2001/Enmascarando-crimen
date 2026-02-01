extends Control

@onready var vbox := $Panel/VBoxContainer
var actions: Array[Dictionary]

func _input(event: InputEvent) -> void:
	
	for action in actions:
		if event.is_action_pressed(action.keyButton):
			print("action:", action.keyButton)
			clear_actions()
			action.sig.emit()


func set_actions(msg:String, actns: Array[Dictionary]):
	clear_actions()
	actions = actns
	visible = true
	var title := Label.new()
	title.text = msg
	title.autowrap_mode = TextServer.AUTOWRAP_OFF
	vbox.add_child(title)
	
	for action in actions:
		var label := Label.new()
		label.text = action.text
		label.autowrap_mode = TextServer.AUTOWRAP_OFF
		vbox.add_child(label)

func clear_actions():
	for child in vbox.get_children():
		child.queue_free()
	visible = false
