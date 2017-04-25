//
//  Alien.swift
//  Badboy Bunny Saves the Alphabet
//
//  Created by Aleksander Makedonski on 4/25/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class Alien: GKEntity{
    
    enum AlienColor{
        case Green, Yellow, Blue, Pink, Beige
    }
    
    convenience init(alienColor: AlienColor, position: CGPoint, targetAgent: GKAgent2D?) {
        self.init()
        
        var texture: SKTexture?
        
        switch(alienColor){
            case .Pink:
                texture = SKTexture(image: #imageLiteral(resourceName: "shipPink_manned"))
                break
            default:
                texture = SKTexture(image: #imageLiteral(resourceName: "shipPink_manned"))
                break
        }
        
        guard let alienTexture = texture else {
            fatalError("Error: the texture for the alien failed to load")
        }
        
        let node = SKSpriteNode(texture: alienTexture)
        node.position = position
        
        let renderComponent = RenderComponent(spriteNode: node)
        addComponent(renderComponent)
        
        let physicsBody = SKPhysicsBody(texture: alienTexture, size: alienTexture.size())
        physicsBody.affectedByGravity = false
        
        let physicsComponent = PhysicsComponent(physicsBody: physicsBody, collisionConfiguration: CollisionConfiguration.Enemy)
        addComponent(physicsComponent)
        
        let orientationComponent = OrientationComponent(currentOrientation: .Left)
        addComponent(orientationComponent)
        
        
        
    }
    
    convenience init(spriteNode: SKSpriteNode, targetAgent: GKAgent2D?) {
        self.init()
    
        let originalPosition = spriteNode.position
        let renderComponent = RenderComponent(position: originalPosition, autoRemoveEnabled: false)
        renderComponent.node = spriteNode
        addComponent(renderComponent)
    
        let orientationComponent = OrientationComponent(currentOrientation: .Right)
        addComponent(orientationComponent)
    
   
        /**
        if let targetAgent = targetAgent{
            let agentComponent = AgentComponent(targetAgent: targetAgent, maxPredictionTime: 10.00,     maxSpeed: 1.00, maxAcceleration: 1.00, lerpingEnabled: true)
            addComponent(agentComponent)
        }
        **/
    }

override init() {
    super.init()
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}


}

extension Alien{
    
    /** TODO: Animations for Alien:
     
    static let spinAnimationLeft = TextureAnimation(animationState: .moving, orientation: .Left, animationName: "spin", textures: [
        SKTexture(image: #imageLiteral(resourceName: "sun1")), SKTexture(image: #imageLiteral(resourceName: "sun2"))
        ], timePerFrame: 0.10, repeatTexturesForever: true)
    static let spinAnimationRight = TextureAnimation(animationState: .moving, orientation: .Right, animationName: "spin", textures: [
        SKTexture(image: #imageLiteral(resourceName: "sun1")),SKTexture(image: #imageLiteral(resourceName: "sun2"))
        ], timePerFrame: 0.10, repeatTexturesForever: true)
    
    static let AnimationsDict: [AnimationState: [Orientation:Animation]] = [
        .moving: [.Left: EnemySun.spinAnimationLeft,
                  .Right: EnemySun.spinAnimationRight]
    ]
     **/
}
