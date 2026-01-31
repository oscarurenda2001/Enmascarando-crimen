extends RichTextLabel

@onready var texto = self

func _ready():
	texto.visible_characters = 0
	await escribir_texto()

func escribir_texto():
	var total = texto.get_total_character_count()
	for i in total:
		texto.visible_characters += 1
		await get_tree().create_timer(0.05).timeout
