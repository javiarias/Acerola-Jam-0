extends Node


@export var growthTime := 100.0
@export var growthSpeed := 1.0
@export var growthMult := 1.0
@export var baseQuality := 1.0
@export var qualityMult := 1.0


@export var stages : Animation


var growth = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if growth >= growthTime:
		#Crop grown! Skip or add effects if needed?
		GrowthComplete(delta)
	else:
		#update growth!
		growth += delta * growthSpeed * growthMult
		
		#update animation?
		# TODO: UPDATE CROP ANIMATION.  GENERIC!
	
	
	pass


func GrowthComplete(delta):
	pass
