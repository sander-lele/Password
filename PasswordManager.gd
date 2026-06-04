extends Control

var Passwords : Array[PasswordObject] = []
var ShownPasswords : Array[PasswordObject] = []

var PasswordLabel : PackedScene = preload("res://Passwordpanel.tscn")

func _ready() -> void:
	create_password("Reverse5","Karin","arineegreidreverse5@men.com","men.com","Admin account for men.com",50)
	ShownPasswords = Passwords
	draw_password_list()

func create_password(Password : String, Username : String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0):
	Passwords.append(PasswordObject.new(Password,Username,Email,Domain,Desc,ExpireTime))

func draw_password_list():
	for PassObj : PasswordObject in ShownPasswords:
		var PassLabelInst : PasswordPanel = PasswordLabel.instantiate()
		PassLabelInst.set_panel_text(PassObj.get_password(),PassObj.get_username(),PassObj.get_email(),PassObj.get_domain(),PassObj.get_desc(),PassObj.get_expiry())
		$VBoxContainer.add_child(PassLabelInst)
