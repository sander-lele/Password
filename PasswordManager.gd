extends Control

var Passwords : Array[PasswordObject] = []
var ShownPasswords : Array[PasswordObject] = []

var PasswordLabel : PackedScene = preload("res://Passwordpanel.tscn")

func _ready() -> void:
	create_password("Reverse5")
	

func create_password(Password : String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0):
	Passwords.append(PasswordObject.new(Password,Email,Domain,Desc,ExpireTime))

func draw_password_list():
	for PassObj : PasswordObject in ShownPasswords:
		var PassLabelInst : Panel = PasswordLabel.instantiate()
		PassLabelInst.set_domain_text(PassObj.get_domain())
