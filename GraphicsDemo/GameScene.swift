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
        
        // Show animation for dinosaur
        // ----------------------------
        // 1. make an array of images for the animation
        // -- SKTexture = Object to hold images
        var dinoTextures:[SKTexture] = []
        for i in 1...15 {
            let fileName = "Walk\(i)"
            print("Adding: \(fileName) to array")
            dinoTextures.append(SKTexture(imageNamed: fileName))
        }
        
        // 2. Tell Spritekit to use that array to create your animation
        let walkingAnimation = SKAction.animate(
            with: dinoTextures,
            timePerFrame: 0.1)
        
        // 3. Repeat the animation forever
        self.dino.run(SKAction.repeatForever(walkingAnimation))
        
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
                // flip image left
                let lookLeft = SKAction.scaleX(to: -1, duration: 0)
                self.dino.run(lookLeft)
                lookingDir = "left"
            }
            else if (lookingDir == "left") {
                // flip image right
                let lookRightAction = SKAction.scaleX(to: 1, duration: 0)
                self.dino.run(lookRightAction)
                lookingDir = "right"
            }
            
        }
    }
    
}
