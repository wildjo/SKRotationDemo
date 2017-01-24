# SpriteKit Rotation Demo

## Why is this here?

Writing my first SpriteKit iOS app, I wanted the app to be able to handle different device orientations. iOS has built-in rotation animations and I wanted to replace them with an animation of my own. I spent several weeks trying to find a way to replace the built-in rotations, but only found ways to supplement the built-in rotation animations, and no way to replace them.

So, I set about learning how to build my own. This is the result of that. It may not be the correct way. There may be a better way, but I couldn't find it. If you have a better way, please feel free to leave a note here.'

## What does it do?

Rotates a sprite in response to changes in device orientation.

## How is it done?

This sample code is based off of a new Xcode project. 

* File: New: Project ->
* Game
* Technology: SpriteKit
* Language: Swift
* Include GameplayKit: No

## #include
* SpriteKit
* CoreMotion

Comments in the code should explain the rest.


### Version Notes

The initial commit is a project where this was done "incorrectly", that is, I used two SpriteKit scenes -- one portrait and one landscape -- and ran a transition between them in response to a device orientation change. This gave a bad result. The transitions work fine, but they run in addition to the default "rotation" animation that iOS runs in response to a device orientation change.


---

Jonnie Wilder
Emojiency [link](http://emojiency.com).



Paragraphs are separated
by a blank line.

Two spaces at the end of a line leave a  
line break.

Text attributes _italic_, *italic*, __bold__, **bold**, `monospace`.

Horizontal rule:

---

Bullet list:

* apples
* oranges
* pears

Numbered list:

1. apples
2. oranges
3. pears

A [link](http://example.com).
