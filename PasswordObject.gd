class_name PasswordObject
extends Node

var _Index : int
var _Password : String
var _Username : String
var _Desc : String
var _Email : String
var _Domain : String
var _ExpireTime : float
var _DateCreated : float
var _Icon : Texture2D

func _init(Index : int,Password : String, Username: String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0, Icon : Texture2D = null) -> void:
	_Index = Index
	_Password = Password
	_Desc = Desc
	_Email = Email
	_Domain = Domain
	_Username = Username
	_ExpireTime = ExpireTime
	_Icon = Icon
	_DateCreated = Time.get_unix_time_from_system()
func get_domain():
	return _Domain

func get_password():
	return _Password

func get_desc():
	return _Desc

func get_expiry():
	return _ExpireTime

func get_email():
	return _Email

func get_username():
	return _Username

func get_date_created():
	return _DateCreated

func get_icon():
	return _Icon
