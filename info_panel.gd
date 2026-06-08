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
@export var PasswordShowButton : Button

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


func _on_data_text_submitted(new_text: String) -> void:
		emit_signal("ChangePasswordValue",SelectedPassObj,"Domain",new_text)
		emit_signal("RefreshPasswordList")


func _on_user_text_submitted(new_text: String) -> void:
		emit_signal("ChangePasswordValue",SelectedPassObj,"Username",new_text)
		emit_signal("RefreshPasswordList")


func _on_email_text_submitted(new_text: String) -> void:
		emit_signal("ChangePasswordValue",SelectedPassObj,"Email",new_text)
		emit_signal("RefreshPasswordList")


func _on_disc_text_changed() -> void:
	emit_signal("ChangePasswordValue",SelectedPassObj,"Desc",DiscText.text)

func _on_password_text_submitted(new_text: String) -> void:
		emit_signal("ChangePasswordValue",SelectedPassObj,"Password",new_text)
		emit_signal("RefreshPasswordList")

func _on_domain_copy_pressed() -> void:
	DisplayServer.clipboard_set(DomainText.text)


func _on_user_copy_pressed() -> void:
	DisplayServer.clipboard_set(UserText.text)


func _on_email_copy_pressed() -> void:
	DisplayServer.clipboard_set(EmailText.text)


func _on_password_copy_pressed() -> void:
	DisplayServer.clipboard_set(PasswordText.text)


func _on_show_toggled(toggled_on: bool) -> void:
	if toggled_on:
		PasswordShowButton.icon = load("res://icons/eye.svg")
	else:
		PasswordShowButton.icon = load("res://icons/eye-closed.svg")
	PasswordText.secret = !toggled_on
