//
//  GameScene.swift
//  LamboGame
//
//  Created by Martin Gamboa on 4/23/17.
//  Copyright © 2017 RenatoGamboa. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftCar = SKSpriteNode()
    var rightCar = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
        createRoadStrip()
        Timer.scheduledTimer(timeInterval: TimeInterval(0.1), target: self, selector: #selector(GameScene.createRoadStrip), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        showRoadStrip()
    }
    
    func setUp() {
        leftCar = self.childNode(withName: "leftCar") as! SKSpriteNode
        rightCar = self.childNode(withName: "rightCar") as! SKSpriteNode
        
    }
    
    func createRoadStrip() {
        let leftRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        leftRoadStrip.strokeColor = SKColor.white
        leftRoadStrip.fillColor = SKColor.white
        leftRoadStrip.alpha = 0.4
        leftRoadStrip.name = "leftRoadStrip"
        leftRoadStrip.zPosition = 10
        leftRoadStrip.position.x = -187.5
        leftRoadStrip.position.y = 700
        addChild(leftRoadStrip)
        
        let rightRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        rightRoadStrip.strokeColor = SKColor.white
        rightRoadStrip.fillColor = SKColor.white
        rightRoadStrip.alpha = 0.4
        rightRoadStrip.name = "rightRoadStrip"
        rightRoadStrip.zPosition = 10
        rightRoadStrip.position.x = 187.5
        rightRoadStrip.position.y = 700
        addChild(rightRoadStrip)

    }
    
    func showRoadStrip() {
        enumerateChildNodes(withName: "leftRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
        
        enumerateChildNodes(withName: "rightRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
    }
    
}
