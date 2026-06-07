extends Panel

signal ChangePasswordValue
signal RefreshPasswordList

@export var IconRect : TextureRect
@export var DomainText : LineEdit
@export var UserText : LineEdit
@export var EmailText : LineEdit
@export var PasswordText : LineEdit
@export var DiscText : TextEdit
@export var UploadDialog : FileDialog

var SelectedPassObj : PasswordObject

func show_info(PassObj : PasswordObject):
	IconRect.texture = PassObj.get_icon()
	DomainText.text = PassObj.get_domain()
	UserText.text = PassObj.get_username()
	EmailText.text = PassObj.get_email()
	PasswordText.text = PassObj.get_password()
	DiscText.text = PassObj.get_desc()
	SelectedPassObj = PassObj


func _on_upload_button_pressed() -> void:
	UploadDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	if path.ends_with(".png"):
		var Img = Image.new()
		Img.load(path)
		var Icon = ImageTexture.create_from_image(Img)
		IconRect.texture = Icon
		emit_signal("ChangePasswordValue",SelectedPassObj,"Icon",Icon)
		emit_signal("RefreshPasswordList")
	else:
		print("file is not png")


func _on_exitbutton_pressed() -> void:
	SelectedPassObj = null
	visible = false
