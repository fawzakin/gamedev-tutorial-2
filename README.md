# Wow, what a game
This repository is for my gamedev class. If you are not me or my teaching assistant, please ignore.

Tutorial site: https://csui-game-development.github.io/tutorial-2

The following is the answer to the questions given from the tutorial page.

# Playtest observation

### 1. What kind of log that's printed at the output panel?
The following is what I gathered as soon as I start the playtest session.
```
--- Debugging process started ---
Godot Engine v3.5.3.stable.official.6c814135b - https://godotengine.org
OpenGL ES 3.0 Renderer: NVIDIA GeForce GTX 1070 Ti/PCIe/SSE2
Async. shader compilation: OFF
 
Platform initialize
```

The first four lines are to tell the dev what they have in their toolkit such as Godot and OpenGL version and the hardware that runs the rendering engine.
The last sentence is what `PlatformBlue.gd` outputs as soon as the script loads.

### 2. Move the platform to the bottom of the screen, then move it until it nearly hits the top. What's the log now?
A new message appears at the output:
```
Reached objective!
```
This message comes from `ObjectiveArea.gd` where if an object enters the ObjectiveArea in the scene, it'll trigger the above message at the output.

### 3. Open the `MainLevel` scene in 2D workspace. Does the location for `ObjectiveArea` have anything to do with the log that's printed on the output panel since the last experiment?
Yes, it does. The object is associated with the `ObjectiveArea.gd` that has been mentioned previously. When an object touches its collision, it'll trigger the script.

# Node inspection

### 4. What's the function of Sprite?
Sprite is used to load up an image (typically under .png format) that's associated with the object to communicate what kind of object directtly to the player visually and artistically. 

### 5. What's the difference between `RigidBody2D` and `StaticBody2D`?
`RigidBody2D` is used for object that can be moved and manipulated by Godot's built-in physic simulation. `StaticBody2D` does not react to anykind of physic simulation.

### 6. Change the value of `Mass` and `Weight` attribute at BlueShip. What would happen during playtesting?
Changing `Mass` would affect the physic and `Weight` is simply Mass x Gravity, the latter of which can be set in the project's setting. However, for this specific case, the speed of which the spaceship falls does NOT show any difference within multiple mass settings. This is because air resistance doesn't exists and it isn't implemented and thus gravity is relied upon to change the object's fall speed.

### 7. Change the value of `Disabled` at `CollisionShape2D` type in `StonePlatform`. What would happen during playtesting?
The ship would phase through the stone platform as the latter does not have any collision for the ship to interact with. It is still in the code, just with "disabled" check turn on. It's a simple way to disable collision without deleting the codebase or if you want to manipulate it by other script.

### 8. Change the value of `Position`, `Rotation`, and `Scale` in `BlueShip`.  What would happen during playtesting?
All values are self-expalantory. Position will change where the spaceship is located (it can also be moved using mouse), Rotation will change the direction of where the ship would face (it also affects the physic when it hit the platform), and Scale will change the physical size of the ship. However, due to the physic engine overriding the scale attribute, the size of BlueShip can NOT be changed directly. Instead, each sprite and collision that make up `BlueShip` must be changed individually. 

### 9. Why does the position for `StonePlatform` not match with its position that appear on inspector yet it is positioned correctly in the visualized scene?
This is because `StonePlatform` is part of `PlatformBlue` node and it inherit the latter's position for its own. Changing the position for `StonePlatform` will change its position relative to the position of `PlatformBlue`. For example, If `PlatformBlue` has `x=100` while `StonePlatform` has `x=10`. `StonePlatform` will appear at `x=110` on the canvas.