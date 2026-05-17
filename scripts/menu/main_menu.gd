extends Control

@onready var start_menu: VBoxContainer = $Start_Menu
@onready var settings_menu: VBoxContainer = $Settings_Menu
@onready var video_menu: VBoxContainer = $Video_Menu
@onready var audio_menu: VBoxContainer = $Audio_Menu
@onready var controls_menu: VBoxContainer = $Controls_Menu
@onready var language_menu: VBoxContainer = $Language_Menu
@onready var back_button: Button = $MarginContainer/BackButton

@onready var video: Button = $Settings_Menu/Video
@onready var audio: Button = $Settings_Menu/Audio
@onready var controls: Button = $Settings_Menu/Controls
@onready var language: Button = $Settings_Menu/Language

var nav_stack : Array[Control] = []
var current_panel


func _ready() -> void:
	current_panel = start_menu
	_show_panel(start_menu)
	#_update_back_button()


func _show_panel(panel : Control):
	panel.visible = true


func _update_back_button():
	if nav_stack.is_empty():
		back_button.visible = false
	else:
		back_button.visible = true


func _navigate_to(panel : Control):
	if current_panel:
		nav_stack.append(current_panel)
		current_panel.visible = false
	
	current_panel = panel
	_show_panel(current_panel)
	_update_back_button()


func _on_back_button_pressed() -> void:
	current_panel.visible = false
	current_panel = nav_stack.pop_back()
	_show_panel(current_panel)
	_update_back_button()


func _on_video_pressed() -> void:
	_navigate_to(video_menu)


func _on_audio_pressed() -> void:
	_navigate_to(audio_menu)


func _on_controls_pressed() -> void:
	_navigate_to(controls_menu)


func _on_language_pressed() -> void:
	_navigate_to(language_menu)


func _on_settings_pressed() -> void:
	_navigate_to(settings_menu)


func _on_start_pressed() -> void:
	SceneLoader.load_scene("res://scenes/cutscenes/intro_cutscene.tscn")
