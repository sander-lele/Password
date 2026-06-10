extends ColorRect

var Pass : String
@export var Lineedit : LineEdit

func clear_pass():
	Pass = ""

func _on_line_edit_text_submitted(new_text: String) -> void:
	Pass = new_text
	hide()
