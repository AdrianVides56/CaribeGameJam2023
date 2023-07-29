extends Node2D


var current_cutscene = "none"  # StoryPresentation   PresentClanse  ...

func _process(delta):
	Global.current_cutscene = current_cutscene
	
	if Global.newFarmingZone_active == true:
		pass
		
	
