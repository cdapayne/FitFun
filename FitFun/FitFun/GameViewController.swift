//
//  GameViewController.swift
//  FitFun
//
//  Created by PayneBrain on 8/29/25.
//

import UIKit
import SpriteKit
import GameplayKit
import WatchConnectivity

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Activate the watch connectivity session as soon as the view loads
        _ = WatchMetricsManager.shared
        
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

}
