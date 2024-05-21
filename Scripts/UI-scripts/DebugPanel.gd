extends PanelContainer
class_name Debug
@onready var v_box_container = $MarginContainer/VBoxContainer

var labels = Array([], TYPE_OBJECT, &"Node", null)
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.debug = self

func _input(event):
	if event.is_action_pressed("debugToggle"):
		visible = not visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func UpdateProperty(nameTxt:String, value):
	for label in labels:
		if label.name == nameTxt :
			label.text = nameTxt + ": " + str(value)
			break

func AddProperty(nameTxt:String, value):
	var labelFPS = Label.new()
	v_box_container.add_child(labelFPS)
	labelFPS.name = nameTxt
	labelFPS.text = nameTxt + ": " + str(value)
	labels.append(labelFPS)

	
