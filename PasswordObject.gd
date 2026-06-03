class_name PasswordObject
extends Node

var _Password : String
var _Desc : String
var _Email : String
var _Domain : String
var _ExpireTime : float


func _init(Password : String, Email : String = "", Domain : String = "", Desc : String = "", ExpireTime : float = 0) -> void:
	_Password = Password
	_Desc = Desc
	_Email = Email
	_Domain = Domain
	_ExpireTime = ExpireTime

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
