extends Control

@export var PasswordHolder : VBoxContainer

var DefaultIcon : Texture2D = load("res://icons/key.svg")

var Passwords : Array[PasswordObject] = []
var ShownPasswords : Array[PasswordObject] = []

var PasswordButtonScene : PackedScene = preload("res://Passwordbutton.tscn")

func _ready() -> void:
	create_password("Reverse5","Karin","reverse5@gmail.com","cat.com","Admin account for cat.com")
	create_password("Reverse5","Aarin","reverse5@gmail.com","dog.com","Admin account for dog.com")
	ShownPasswords = Passwords
	print(Time.get_date_string_from_unix_time(Passwords[0].get_date_created()))
	create_password_list()

func create_password(Password : String, Username : String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0,Icon : Texture2D = DefaultIcon):
	Passwords.append(PasswordObject.new(Passwords.size(),Password,Username,Email,Domain,Desc,ExpireTime,Icon))

func create_password_list():
	for PassBut : PasswordButton in get_tree().get_nodes_in_group("password_button"):
		print("cat")
		PassBut.queue_free()
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



func _on_info_panel_change_password_value(PassObj : PasswordObject,ValueToChange : String,NewValue) -> void:
	match(ValueToChange):
		"Username":
			PassObj.set_username(NewValue)
		"Password":
			PassObj.set_password(NewValue)
		"Email":
			PassObj.set_email(NewValue)
		"Domain":
			PassObj.set_domain(NewValue)
		"Desc":
			PassObj.set_desc(NewValue)
		"Icon":
			PassObj.set_icon(NewValue)


func _on_info_panel_refresh_password_list() -> void:
	create_password_list()


func _on_new_pressed() -> void:
	$PasswordGen.show()


func _on_create_pressed() -> void:
	$HBox/InfoPanel.show()
	$HBox/InfoPanel.show_empty()


func _on_password_create_pressed() -> void:
	var PassObjData : Array = $HBox/InfoPanel.get_panel_info()
	create_password(PassObjData[4],PassObjData[2],PassObjData[3],PassObjData[1],PassObjData[5])
	create_password_list()
