//
//  MotionResponderComponent.swift
//  Badboy Bunny Saves the Alphabet
//
//  Created by Aleksander Makedonski on 4/25/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit
import CoreMotion

class MotionResponderComponent: GKComponent{
    
    var motionManager: CMMotionManager!
    
    var physicsBody: SKPhysicsBody{
        guard let physicsBody = entity?.component(ofType: PhysicsComponent.self)?.physicsBody else {
            fatalError("Entity must have a physics body in order to enable its MotionResponderComponent functionality")
        }
        
        return physicsBody
    }
    
    
    var appliedForceDeltaX: CGFloat = 0.00
    var appliedForceDeltaY: CGFloat = 0.00
    
    
    init(motionManager: CMMotionManager){
        super.init()
        
        self.motionManager = motionManager
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        
        
    }
    
}
