extends Panel

@export var DomainLabel : Label
@export var UsernameLabel : Label
@export var EmailLabel : Label
@export var ExpiryLabel : Label
@export var PasswordLabel : LineEdit

func set_domain_text(Text : String):
	DomainLabel.text = Text

func set_username_text(Text : String):
	UsernameLabel.text = Text

func set_email_text(Text : String):
	EmailLabel.text = Text

func set_expiry_text(Text : float):
	ExpiryLabel.text = str(Text)

func set_password_text(Text : String):
	PasswordLabel.text = Text
