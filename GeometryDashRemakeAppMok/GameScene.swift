//
//  GameScene.swift
//  GeometryDashRemakeAppMok
//
//  Created by TYLER MOK on 2/23/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player: SKSpriteNode!
    let cam = SKCameraNode()
    var scoreLabel: SKLabelNode!
    var score = 0
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        scoreLabel = self.childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel.text = "\(score)"
        
        // making an outlet for the ball on the screen
        player = self.childNode(withName: "player") as? SKSpriteNode
        
        self.camera = cam
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("hit")
        
        
        // adding 1 to score when the ball hits only the coin
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "coin") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "coin")  {
            score = score + 1
            scoreLabel.text = "\(score)"
            if contact.bodyA.node?.name == "coin" {
                contact.bodyA.node?.removeFromParent()
                player.physicsBody?.velocity.dx = 500
            }
            if contact.bodyB.node?.name == "coin" {
                contact.bodyB.node?.removeFromParent()
                player.physicsBody?.velocity.dx = 500
            }
        }
    }
    
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        cam.position.x = player.position.x
        cam.position.y = player.position.y - 50
        scoreLabel.position.x = cam.position.x + 500
        scoreLabel.position.y = cam.position.y + 225
       // player.physicsBody?.velocity.dx = 500
        
        if player.position.y < -480 {
           respawn()
        }
     }
    
    
    func respawn() {
        player.position.x = -480
        player.position.y = 50
    }
    
    
    func jump() {
        player.physicsBody?.velocity.dy = 750
    }
    
    func left() {
        player.physicsBody?.velocity.dx = -500
    }
    
    func right() {
        player.physicsBody?.velocity.dx = 500
    }
    
    
}
