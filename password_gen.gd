extends ColorRect

signal send_password

@export var ResultString : Label
@export var LenghtSlider : HSlider
@export var CapCheck : CheckBox
@export var NumCheck : CheckBox
@export var SymCheck : CheckBox
@export var LenghtString : Label

var SmallCharString = "abcdefghijkmnopqrstuvwxyz"
var BigCharString = "ABCDEFGHJKLMNPQRSTUVWXYZ"
var NumChars = "1234567890"
var SpecSymbalsString = "!#%&/()=?{}[]<>;:-_*'"

var Result : String

func _ready() -> void:
	generate_password()

func generate_password():
	var RandString : String = SmallCharString
	Result = ""
	if CapCheck.button_pressed == true:
		RandString += BigCharString
	if NumCheck.button_pressed == true:
		RandString += NumChars
	if SymCheck.button_pressed == true:
		RandString += SpecSymbalsString
	for i in LenghtSlider.value:
		Result += RandString[randi_range(0,RandString.length() - 1)]
	ResultString.text = Result


func _on_h_slider_value_changed(value: float) -> void:
	LenghtString.text = str(roundi(value))
	generate_password()


func _on_exit_pressed() -> void:
	hide()


func _on_caps_pressed() -> void:
	generate_password()


func _on_nums_pressed() -> void:
	generate_password()


func _on_syms_pressed() -> void:
	generate_password()


func _on_yeah_pressed() -> void:
	hide()
	emit_signal("send_password",Result)
