extends Panel

signal ChangePasswordValue
signal RefreshPasswordList

@export var TitleText : Label
@export var IconRect : TextureRect
@export var DomainText : LineEdit
@export var UserText : LineEdit
@export var EmailText : LineEdit
@export var PasswordText : LineEdit
@export var DiscText : TextEdit
@export var UploadDialog : FileDialog
@export var PasswordShowButton : Button
@export var SaveButton : Button
@export var CreateButton : Button

var SelectedPassObj : PasswordObject


func show_info(PassObj : PasswordObject):
	IconRect.texture = PassObj.get_icon()
	DomainText.text = PassObj.get_domain()
	UserText.text = PassObj.get_username()
	EmailText.text = PassObj.get_email()
	PasswordText.text = PassObj.get_password()
	DiscText.text = PassObj.get_desc()
	SelectedPassObj = PassObj
	TitleText.text = "Muuda parooli:"
	SaveButton.show()
	CreateButton.hide()

func show_empty():
	IconRect.texture = load("res://icons/key.svg")
	DomainText.text = ""
	UserText.text = ""
	EmailText.text = ""
	PasswordText.text = ""
	DiscText.text = ""
	TitleText.text = "Loo parool:"
	SaveButton.hide()
	CreateButton.show()

func _on_upload_button_pressed() -> void:
	UploadDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	if path.ends_with(".png"):
		var Img = Image.new()
		Img.load(path)
		var Icon = ImageTexture.create_from_image(Img)
		IconRect.texture = Icon
	else:
		print("file is not png")


func _on_exitbutton_pressed() -> void:
	SelectedPassObj = null
	visible = false


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


func get_panel_info():
	return [IconRect.texture,DomainText.text,UserText.text,EmailText.text,PasswordText.text,DiscText.text]

func _on_password_gen_send_password(NewPassword : String) -> void:
	PasswordText.text = NewPassword


func _on_save_pressed() -> void:
	emit_signal("ChangePasswordValue",SelectedPassObj,"Icon",IconRect.texture)
	emit_signal("ChangePasswordValue",SelectedPassObj,"Domain",DomainText.text)
	emit_signal("ChangePasswordValue",SelectedPassObj,"Username",UserText.text)
	emit_signal("ChangePasswordValue",SelectedPassObj,"Email",EmailText.text)
	emit_signal("ChangePasswordValue",SelectedPassObj,"Password",PasswordText.text)
	emit_signal("ChangePasswordValue",SelectedPassObj,"Desc",DiscText.text)
	emit_signal("RefreshPasswordList")
