# SpriteKit Rotation Demo

## Why is this here?

Writing my first SpriteKit iOS app, I wanted the app to be able to handle different device orientations. iOS has built-in rotation animations and I wanted to replace them with an animation of my own. I spent several weeks trying to find a way to replace the built-in rotations, but only found ways to supplement the built-in rotation animations, and no way to replace them.  

So, I set about learning how to build my own. This is the result of that. It may not be the correct way. There may be a better way, but I couldn't find it. If you have a better way, please feel free to leave a note here.  

## What does it do?

Rotates a sprite in response to changes in device orientation.  

## How is it done?

This sample code is based off of a new Xcode project.  

* File: New: Project ->
* Game
* Technology: SpriteKit
* Language: Swift
* Include GameplayKit: No

### #include
* Foundation
* UIKit
* SpriteKit
* GameplayKit
* CoreMotion

Apple adds enough sample code to get some interactivity going, I didn't futz with it.

###GameScene.sks

I've edited the initial sprite to be a finger-pointing-up emoji. Then code is added to rotate the finger in response to device orientation changes so it's always pointing up.

A second sprite is added to display a caption describing the orientation, "Portait", "Landscape", etc.

###GameViewController.swift

shouldAutorotate is overridden to be false. The whole point here is to do a nice animation for rotation and not the included ugly one. I couldn't find documentation anywhere to replace the default animation.  The Target will still report that it supports four different orientations, but iOS isn't doing the work here. SpriteKit is.

The GameViewController is set up to record gyroscope events (through determineDeviceOrientation() which is called on viewDidLoad()). The .startDeviceMotionUpdates method installs a closure that constantly updates the singleton instance of the DeviceOrientation class with an (x,y) tuple that describes the device orientation.

There are two very good blog posts on using CoreMotion in Swift where I learned how to do this. [CMDeviceMotion](http://nshipster.com/cmdevicemotion/) and [Using Core Motion in Swift 2.2](http://avikam.com/software/using-core-motion-in-swift-2-2). The second post was updated with a fix for Swift 3 in the comments.

### GameScene.swift

.didMove is where constants for the two labels are created.

.update is where the action happens. Every frame update is called I run a new action on the finger-pointing-up emoji label to rotate it to the current device orientation angle. Likewise, every frame a check for the general orientation occurs and a label is put on the appropriate edge.

### DeviceOrientation.swift

This is where the data is kept.

DeviceOrientation is a singleton class expressed as theDeviceOrientation.

Data comes in through the motionGravity tuple property which is updated through an asychronous closure started up in GameViewController.

Data goes out either as a vector angle, through the gravityVector property which is used to rotate the finger-pointing-up emoji.

The angle also helps determine the general device orientation in the deviceIsOriented property.

### Additional Documentation

(http://emojiency.com/bloggityblogblog/2017/01/code-spritekit-and-coremotion/)
(http://emojiency.com/bloggityblogblog/2017/01/update-on-that-0-degrees-being-90-degrees-thing/)

### Version Notes

The initial commit is a project where this was done "incorrectly", that is, I used two SpriteKit scenes -- one portrait and one landscape -- and ran a transition between them in response to a device orientation change. This gave a bad result. The transitions work fine, but they run in addition to the default "rotation" animation that iOS runs in response to a device orientation change.


---

Jonnie Wilder  
[Emojiency.com](http://emojiency.com).  
