//
//  GameScene.swift
//  GraphicsDemo
//
//  Created by MacStudent on 2019-06-13.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    // sprites
    var changeDirectionButton:SKLabelNode!
    var dino:SKNode!
    
    override func didMove(to view: SKView) {
        //  get sprites from Scene Kit Editor
        self.changeDirectionButton = self.childNode(withName: "directionButton") as! SKLabelNode
        self.dino = self.childNode(withName: "dino")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    var lookingDir = "right"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let mouseLocation = touch!.location(in:self)
        let spriteTouched = self.atPoint(mouseLocation)
   
        // check if person pressed the button
        if (spriteTouched.name == "directionButton") {
            print("PRESSED THE BUTTON")
            if (lookingDir == "right") {
                // turn him left
                let lookLeft = SKAction.scaleX(to: -1, duration: 0)
                self.dino.run(lookLeft)
                lookingDir = "left"
            }
            else if (lookingDir == "left") {
                let lookRightAction = SKAction.scaleX(to: 1, duration: 0)
                self.dino.run(lookRightAction)
                lookingDir = "right"
            }
            
        }
    }
    
}
