extends Panel

@export var IconRect : TextureRect
@export var DomainText : LineEdit
@export var UserText : LineEdit
@export var EmailText : LineEdit
@export var PasswordText : LineEdit
@export var DiscText : TextEdit
@export var UploadDialog : FileDialog

func show_info(PassObj : PasswordObject):
	IconRect.texture = PassObj.get_icon()
	DomainText.text = PassObj.get_domain()
	UserText.text = PassObj.get_username()
	EmailText.text = PassObj.get_email()
	PasswordText.text = PassObj.get_password()
	DiscText.text = PassObj.get_desc()


func _on_upload_button_pressed() -> void:
	UploadDialog.show()


func _on_file_dialog_file_selected(path: String) -> void:
	IconRect.texture = load(path)
