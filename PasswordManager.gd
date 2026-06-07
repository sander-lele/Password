extends Control

@export var PasswordHolder : VBoxContainer

var Passwords : Array[PasswordObject] = []
var ShownPasswords : Array[PasswordObject] = []

var PasswordButtonScene : PackedScene = preload("res://Passwordbutton.tscn")

func _ready() -> void:
	create_password("Reverse5","Karin","reverse5@gmail.com","cat.com","Admin account for cat.com")
	create_password("Reverse5","Aarin","reverse5@gmail.com","dog.com","Admin account for dog.com")
	ShownPasswords = Passwords
	print(Time.get_date_string_from_unix_time(Passwords[0].get_date_created()))
	create_password_list()

func create_password(Password : String, Username : String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0):
	Passwords.append(PasswordObject.new(Passwords.size(),Password,Username,Email,Domain,Desc,ExpireTime))

func create_password_list():
	for PassObj : PasswordObject in Passwords:
		var PassButtonInst : PasswordButton = PasswordButtonScene.instantiate()
		PassButtonInst.set_all(PassObj)
		PassButtonInst.pressed.connect(password_button_pressed.bind(PassObj))
		PasswordHolder.add_child(PassButtonInst)

func password_button_pressed(PassObj):
	$HBox/InfoPanel.visible = true
	$HBox/InfoPanel.show_info(PassObj)


func _on_info_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		grab_focus()
