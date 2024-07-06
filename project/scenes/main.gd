extends Node2D

@onready var character = $Character
@onready var text_edit = $ColorRect/VBox/HBox/TextEdit
@onready var classificacao = $ColorRect/VBox/Classificacao
@onready var animation = $Animation

func _ready():
	character.group_changed.connect(animate)

func _input(event):
	if Input.is_action_just_pressed("ui_text_submit"):
		_on_button_pressed()

func _on_button_pressed():
	classificacao.set_text("[center]Classificação: [wave amp=40.0 freq=5.0 connected=1][rainbow freq=0.5 sat=0.5 val=1.0]%s" % character.change_class(int(text_edit.get_line_edit().get_text())))

func animate():
	animation.play("rainbow")
