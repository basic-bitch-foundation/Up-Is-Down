extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	
	
	
	
func _on_body_entered(body):
	
	
	if body.is_in_group("player"):
		get_tree().current_scene.getnode("CanvasLayer")._add_score(1)
		print("Coin Collected")
		queue_free()









'''gfhg

Good, now we’ll stay focused on understanding that line in different situations.

🔹 First: what does get_tree() do?
get_tree()

It gives you the SceneTree = the whole running game.

Think:

all scenes
all nodes
everything currently alive
🔹 current_scene
get_tree().current_scene

This gives:

the main scene currently running

Example:

Main
 ├── Player
 ├── Coin
 └── CanvasLayer

So current_scene = Main

🔹 Version 1: Same scene (your current case)
get_tree().current_scene.get_node("CanvasLayer")._add_score(1)

Meaning:

go to Main
find CanvasLayer
call function
🔹 Version 2: If CanvasLayer is deeper

Scene:

Main
 └── UI
      └── CanvasLayer
ljhklh
Then:

get_tree().current_scene.get_node("UI/CanvasLayer")._add_score(1)
🔹 Version 3: If you are already close (parent access)

If your coin is inside Main:

get_parent().get_node("CanvasLayer")._add_score(1)

OR:

get_node("../CanvasLayer")._add_score(1)

(.. means go up one level)

🔹 Version 4: If CanvasLayer is in another scene

This only works if that scene is currently in the tree.

Example:

Root
fsdfsfdgsg ├── Main
 └── UI_Scene
      └── CanvasLayer
=
Then:

get_tree().root.get_node("UI_Scene/CanvasLayer")._add_score(1)
🔹 Version 5: Safest way (absolute path)
get_node("/root/Main/CanvasLayer")._add_score(1)
/root = very top
then full path down
🔹 Cleaner step-by-step version
var tree = get_tree()
var main = tree.current_scene
var ui = main.get_node("CanvasLayer")

ui._add_score(1)

Same thing, easier to debug.

🧠 Key rules
get_tree() = whole game
current_scene = main scene
get_node("path") = find child
"../" = go up
"/root/..." = absolute path
🔥 Most useful ones for you

Use these 2:

Same scene:
get_tree().current_scene.get_node("CanvasLayer")
Slightly cleaner:
get_node("/root/Main/CanvasLayer")
⚠️ Important limitation

This only works if:

CanvasLayer is already in scene
path is correct

Otherwise → error

If you want next:
I can show you a tiny debug trick to print all nodes in tree so you never guess paths again.'''
