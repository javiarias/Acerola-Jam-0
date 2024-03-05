extends Sprite2D


@export var growthTime := 100.0
@export var growthMult := 1.0
@export var baseQuality := 1.0
@export var qualityMult := 1.0


@export var StagesSprites : Array[Texture2D]
var stages = StagesSprites.size()
var growthTimeStage = growthTime / stages


var currentStage = 1
var growth = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = StagesSprites[0]
	stages = StagesSprites.size()
	growthTimeStage = growthTime / stages
	pass # Replace with function body.


func _process(delta):
	#update growth!
	growth += delta * GameManager.sToMinute * growthMult
	
	if growth >= growthTime:
		# TODO: Crop grown! Skip or add effects if needed?
		GrowthComplete(delta)
	else:
		
		#update animation?
		if(growth >= growthTimeStage * currentStage):
			texture = StagesSprites[currentStage]
			currentStage += 1
			pass
	
	pass


func GrowthComplete(delta):
	# TODO: Crop grown! Skip or add effects if needed?
	
	# FIXME: Temp stuff!!!
	Harvest()
	pass

func Harvest():
	
	# FIXME: Temp stuff!!!
	Reset()
	pass

func Reset():
	texture = StagesSprites[0]
	growth = 0
	currentStage = 1
	pass
