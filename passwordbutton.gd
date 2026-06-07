extends Button
class_name PasswordButton

@export var Icon : TextureRect
@export var Domain : Label
@export var Email : Label

var PassObj : PasswordObject

func set_all(GivenPassObj : PasswordObject):
	PassObj = GivenPassObj
	set_icon(PassObj.get_icon())
	set_domain_text(PassObj.get_domain())
	set_email_text(PassObj.get_email())

func set_icon(IconImage : Texture2D = Texture2D.new()):
	Icon.texture = IconImage

func set_domain_text(Text : String = ""):
	Domain.text = Text

func set_email_text(Text : String = ""):
	Email.text = Text
