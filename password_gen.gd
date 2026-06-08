extends ColorRect

@export var ResultString : Label
@export var LenghtSlider : HSlider
@export var CapCheck : CheckBox
@export var NumCheck : CheckBox
@export var SymCheck : CheckBox

var SmallCharString = "abcdefghijklmnopqrstuvwxyz"
var BigCharString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var NumChars = "1234567890"
var SpecSymbalsString = "!#%&/()=?{}[]<>|;:-_*'"

func generate_password():
	var RandString : String = SmallCharString
	var result : String = ""
	if CapCheck.button_pressed == true:
		RandString += BigCharString
	if NumCheck.button_pressed == true:
		RandString += NumChars
	if SymCheck.button_pressed == true:
		RandString += SpecSymbalsString
	for i in LenghtSlider.value:
		result += RandString[randi_range(0,RandString.length() - 1)]
	ResultString.text = result


func _on_h_slider_value_changed(value: float) -> void:
	generate_password()
