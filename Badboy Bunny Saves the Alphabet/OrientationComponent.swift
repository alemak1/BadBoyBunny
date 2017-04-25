//
//  OrientationComponent.swift
//  AlphabetPilot
//
//  Created by Aleksander Makedonski on 4/22/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit


enum Orientation: String{
    case Left, Right
}


class OrientationComponent: GKComponent{
    
 
    var currentOrientation: Orientation
    
    init(currentOrientation: Orientation){
        self.currentOrientation = currentOrientation
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        guard let physicsBody = entity?.component(ofType: PhysicsComponent.self)?.physicsBody else { return }
        
        if physicsBody.velocity.dx > 10{
            currentOrientation = .Right
        } else if physicsBody.velocity.dx < -10 {
            currentOrientation = .Left
        }
        
    }
}

