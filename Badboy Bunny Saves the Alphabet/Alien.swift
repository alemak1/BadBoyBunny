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

class Alien: Enemy{
    
    enum AlienColor{
        case Green, Yellow, Blue, Pink, Beige
    }
    
    let notificationObserverQueue = OperationQueue()
    
    convenience init(alienColor: AlienColor, position: CGPoint, nodeName: String, targetAgent: GKAgent2D?) {
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
        
        let nodeNameComponent = NodeNameComponent(nodeName: nodeName)
        addComponent(nodeNameComponent)
        
        let physicsBody = SKPhysicsBody(texture: alienTexture, size: alienTexture.size())
        physicsBody.affectedByGravity = false
        
        let physicsComponent = PhysicsComponent(physicsBody: physicsBody, collisionConfiguration: CollisionConfiguration.Enemy)
        addComponent(physicsComponent)
        
        let orientationComponent = OrientationComponent(currentOrientation: .None)
        addComponent(orientationComponent)
        
        let animationComponent = AnimationComponent(animations: Alien.AnimationsDict)
        addComponent(animationComponent)
        
        if let targetAgent = targetAgent{
            let agentComponent = AgentComponent(targetAgent: targetAgent, maxPredictionTime: 10.00, maxSpeed: 1.00, maxAcceleration: 1.00, lerpingEnabled: true)
            addComponent(agentComponent)
        }
        
        let targetNode = TargetNodeComponent()
        addComponent(targetNode)
        
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
    
    static let setUnmannedTexture = TextureAnimation(animationState: .inactive, orientation: .None, animationName: "setUnmanned", textures: [
        SKTexture(image: #imageLiteral(resourceName: "shipPink"))
        ], timePerFrame: 0.10, repeatTexturesForever: false)
    
    
    static let setMannedTexture = TextureAnimation(animationState: .moving, orientation: .None, animationName: "setManned", textures: [
        SKTexture(image: #imageLiteral(resourceName: "shipPink_manned"))
        ], timePerFrame: 0.10, repeatTexturesForever: false)
    
   
    
    static let AnimationsDict: [AnimationState: [Orientation:Animation]] = [
        .inactive: [.None: Alien.setUnmannedTexture],
        .moving: [.None: Alien.setMannedTexture]
        ]
 
}
