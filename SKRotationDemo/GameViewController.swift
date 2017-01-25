//
//  GameViewController.swift
//  SKRotationDemo
//
//  Created by Johanna Wilder on 1/12/17.
//  Copyright © 2017 Emojiency. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreMotion

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            determineDeviceOrientation()
        }
    }

    
    // Found this information here
    // http://nshipster.com/cmdevicemotion/
    // and
    // http://avikam.com/software/using-core-motion-in-swift-2-2
    // Doesn't work in Swift 3, but fix for Swift 3 in comments
    
    // This activates CoreMotion
    let motionManager = CMMotionManager()
    // Create a queue for CoreMotion events, we pass this into startDeviceMotionUpdates
    let queue = OperationQueue()
    
    // Put the information from the CoreMotion queue into a singleton instance of a data object theDeviceOrientation
    func determineDeviceOrientation() {
        if motionManager.isGyroAvailable { // alternatively isMotionDeviceAvailable to include the accelerometer
            motionManager.gyroUpdateInterval = 1 // Update interval in seconds
            motionManager.startDeviceMotionUpdates(to: queue, withHandler: { (data, error) in
                guard let data = data else { return }
                theDeviceOrientation.motionGravity = (data.gravity.x, data.gravity.y)
            })
        }
    }
    
    // We're doing our own thing here, so we turn off iOS's responses to device orientation changes
    override var shouldAutorotate: Bool {
        return false
    }

    // Yeah, hide this puppy because it's just going to get in the way
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // If this were your app, you'd do something here
        // Release any cached data, images, etc that aren't in use.
    }
    
}
