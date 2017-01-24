//
//  GameScene.swift
//  SKRotationDemo
//
//  Created by Johanna Wilder on 1/12/17.
//  Copyright © 2017 Emojiency. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var captionLabel: SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        // This is where we rotate the Finger Pointing Up emoji label
        // I'm sure this is incredibly inefficient, as we don't check to see if we're already running an action on the node
        // we just keep updating the action to move the label so it's always pointing "up".
        // SpriteKit actions run like this interrupt the current action and start the new animation immediately.
        self.label = self.childNode(withName: "orientationLabel") as? SKLabelNode
        if let label = self.label {
            let rotateTo = SKAction.rotate(toAngle: theDeviceOrientation.gravityVector + CGFloat(90.degreesToRadians), duration: 0.25, shortestUnitArc: true)
            label.run(rotateTo)
            }

        self.captionLabel = self.childNode(withName: "captionLabel") as? SKLabelNode
        self.captionLabel?.text = theDeviceOrientation.orientations[theDeviceOrientation.deviceIsOriented]
        switch theDeviceOrientation.deviceIsOriented {
            case .portrait:
                self.captionLabel?.position = CGPoint(x: 0.0, y: -550.0)
                self.captionLabel?.zRotation = CGFloat(0.degreesToRadians)
            case .landscapeLeft:
                self.captionLabel?.position = CGPoint(x: -300.0, y: 0.0)
                self.captionLabel?.zRotation = CGFloat(-90.degreesToRadians)
            case .landscapeRight:
                self.captionLabel?.position = CGPoint(x: 300, y: 0.0)
                self.captionLabel?.zRotation = CGFloat(90.degreesToRadians)
            case .upsideDown:
                self.captionLabel?.position = CGPoint(x: 0.0, y: 550.0)
                self.captionLabel?.zRotation = CGFloat(180.degreesToRadians)
            default:
                self.captionLabel?.position = CGPoint(x: 0.0, y: 0.0)
            }
        
        
        // Called before each frame is rendered
    }
}
