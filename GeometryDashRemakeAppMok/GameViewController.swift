//
//  GameViewController.swift
//  GeometryDashRemakeAppMok
//
//  Created by TYLER MOK on 2/23/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var play: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                play = scene as! GameScene
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

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .landscapeRight
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func leftAction(_ sender: UIButton) {
        play.left()
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        play.right()
    }
    
    @IBAction func upAction(_ sender: UIButton) {
        play.jump()
    }
    
    
    
    
}
