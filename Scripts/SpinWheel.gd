extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng 
const GAMESTATE=["idle","spinning","spin_stopped","score"]
var state="idle"
# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state =="spinning":
		self.rotate(delta)
	#pass
	


func _on_Tween_tween_completed(object, key):
	#print("tween completed")
	if state =="spinning":
		$Tween.stop_all()
		if self.rotation_degrees>360.0:
			self.rotation_degrees-=360.0
			
			#print(self.rotation_degrees)

func _on_Timer_timeout():
	var finalRoation = rng.randf_range(0.0, 360.0)
	if state =="spinning":		
		if finalRoation<self.rotation_degrees:	
			finalRoation+=self.rotation_degrees
			$Tween.interpolate_method(self, "set_rotation_degrees", self.rotation_degrees, finalRoation, 4,Tween.TRANS_LINEAR,Tween.EASE_OUT)
			print("here")
			print(self.rotation_degrees)
			#$Tween.start()
	
