extends HBoxContainer

var Year : int = 0
var Month : int = 0
var Day : int = 0

func convert_to_unix_float():
	var time = Time.get_unix_time_from_datetime_string("%d-%d-%d" % [Year,Month,Day])
	print(time)

func _on_year_data_value_changed(value: int) -> void:
	Year = value
	convert_to_unix_float()


func _on_month_data_value_changed(value: int) -> void:
	Month = value
	convert_to_unix_float()


func _on_day_data_value_changed(value: int) -> void:
	Day = value
	convert_to_unix_float()
