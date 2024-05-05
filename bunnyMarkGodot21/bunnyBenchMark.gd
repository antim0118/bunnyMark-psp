extends Node2D

#based on https://www.goodboydigital.com/pixijs/bunnymark/js/bunnyBenchMark.js
var Bunny = preload("bunny.gd")

var width = 480
var height = 272

var wabbitTexture
var pirateTexture

var bunnys = []
var gravity = 0.5#1.5

var maxX = width - 26/2.0
var minX = -26/2.0
var maxY = height - 37/2.0
var minY = -37/2.0

var startBunnyCount = 2
var isAdding = false
var count = 0
var container
var pixiLogo
var clickImage

var amount = 10

var tex = preload("res://bunnys.png")
var bunny1 = Rect2(2, 47, 26, 37)
var bunny2 = Rect2(2, 86, 26, 37)
var bunny3 = Rect2(2, 125, 26, 37)
var bunny4 = Rect2(2, 164, 26, 37)
var bunny5 = Rect2(2, 2, 26, 37)
var bunnyTextures = [bunny1, bunny2, bunny3, bunny4, bunny5];
var bunnyType = 2;
var currentTexture = bunnyTextures[bunnyType];

func _ready():
	randomize()
	for i in range(startBunnyCount):
		var bunny = Bunny.new(currentTexture)
		bunny.speedX = rand_range(0, 10)
		bunny.speedY = rand_range(0, 10) - 5
		bunnys.append(bunny);
	
	set_process(true)
	set_process_input(true)

func mousedown():
	isAdding = true

func mouseup():
	bunnyType +=1
	bunnyType %= 5
	currentTexture = bunnyTextures[bunnyType]
	
	isAdding = false


func _input(event):
	if(event.is_action_pressed("ui_accept")):
		mousedown()
	elif(event.is_action_released("ui_accept")):
		mouseup()


var t = 0.0
func _process(delta):
	
	if(isAdding):
		# add 10 at a time :)
		if(count < 5000):
			for i in range(amount):
				var bunny = Bunny.new(currentTexture)
				bunny.speedX = rand_range(0, 10)
				bunny.speedY = rand_range(0, 10) - 5
				
				bunnys.append(bunny);
				var scale = 0.5 + rand_range(0, 0.5)
				bunny.rect.size = Vector2(26.0 * scale,37.0 * scale)
				bunny.rotation = randf()-0.5
				
				count += 1
	
	t += delta*100
	if(t>1.0):
		t=0.0
		update()

var font = preload("res://font.fnt")
var color = Color(0, 0, 0)
func _draw():
	for bunny in bunnys:
		bunny.rect.pos.x += bunny.speedX
		bunny.rect.pos.y += bunny.speedY
		bunny.speedY += gravity
		
		if(bunny.rect.pos.x > maxX):
			bunny.speedX *= -1.0
			bunny.rect.pos.x = maxX
		elif(bunny.rect.pos.x < minX):
			bunny.speedX *= -1.0
			bunny.rect.pos.x = minX
		
		if(bunny.rect.pos.y > maxY):
			bunny.speedY *= -0.85
			bunny.rect.pos.y = maxY
			#bunny.spin = (randf()-0.5) * 0.2
			if(randf() > 0.5):
				bunny.speedY -= rand_range(0,6)
		elif(bunny.rect.pos.y < minY):
			bunny.speedY = 0.0
			bunny.rect.pos.y = minY
		
		var p = bunny.rect.pos/480.0
		draw_texture_rect_region(tex, bunny.rect, bunny.tex_rect)
		#draw_line(bunny.rect.pos - Vector2(1,1)*bunny.scale, bunny.rect.pos + Vector2(1,1)*bunny.scale, Color(p.x, 0,0), 2)
		#draw_line(bunny.position + Vector2(1,1)*bunny.scale, bunny.position - Vector2(1,1)*bunny.scale, color, 2)
	draw_rect(Rect2(0,0,66,24), Color("#00FFFF"))
	draw_string(font, Vector2(0, 8), str(Performance.get_monitor(0)) + " FPS", color)
	draw_string(font, Vector2(0, 20), str(count) + " BUNNIES", color)