extends StaticBody2D

export(int, 0, 500) var health = 100


func takeDamage(amount):
	health -= amount
	print(name, " took ", amount , " damage. Health now ", health)
	if health <= 0:
		blowUp()
		

func blowUp():
	queue_free()
