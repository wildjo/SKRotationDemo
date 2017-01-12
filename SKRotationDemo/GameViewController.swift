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
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        var scene: SKScene
        
        if size.height > size.width {
            scene = GameScene(fileNamed: "GameScene")!
            } else {
            scene = GameScene(fileNamed: "GameSceneLandscape")!
            }
        let view = self.view as! SKView?
        let crossFadeTransition = SKTransition.crossFade(withDuration: 2.0)
        scene.scaleMode = .aspectFill
        view?.presentScene(scene, transition: crossFadeTransition)
        
        super.viewWillTransition(to: size, with: coordinator)
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
