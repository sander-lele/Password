class_name PasswordPanel
extends Panel

@export var DomainLabel : Label
@export var UsernameLabel : Label
@export var EmailLabel : Label
@export var ExpiryLabel : Label
@export var PasswordLabel : LineEdit
@export var DescLabel : Label

func set_panel_text(Password : String, Username : String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0):
	set_password_text(Password)
	set_username_text(Username)
	set_email_text(Email)
	set_domain_text(Domain)
	set_desc_text(Desc)
	set_expiry_text(ExpireTime)

func set_domain_text(Text : String = ""):
	DomainLabel.text = Text

func set_username_text(Text : String = ""):
	UsernameLabel.text = Text

func set_email_text(Text : String = ""):
	EmailLabel.text = Text

func set_expiry_text(Text : float = 0.00):
	ExpiryLabel.text = str(Text)

func set_password_text(Text : String = ""):
	PasswordLabel.text = Text

func set_desc_text(Text : String = ""):
	DescLabel.text = Text
