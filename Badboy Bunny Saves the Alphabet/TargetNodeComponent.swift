//
//  TargetNodeComponent.swift
//  Badboy Bunny Saves the Alphabet
//
//  Created by Aleksander Makedonski on 4/26/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class TargetNodeComponent: GKComponent{
    
    
    var targetNode: SKSpriteNode?
    var renderNode: SKSpriteNode?
    
    override init(){
        super.init()
        
        registerForNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        renderNode = entity?.component(ofType: RenderComponent.self)?.node
    }
    
    override func willRemoveFromEntity() {
        renderNode = nil
        targetNode = nil
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        if targetNode != nil, renderNode != nil{
            
            renderNode!.lerpToPoint(targetPoint: targetNode!.position, withLerpFactor: 0.10)
        }
    }
    
    /** If the target has been intercepted and hit by the attacking enemy, then the target is set to nil
 
    **/
    func targetHit(notification: Notification){
        
        let userInfo = notification.userInfo
        
        if let enemyName = userInfo?["enemyName"] as? String, enemyName == renderNode?.name{
            targetNode = nil
        }
        
    }
    
    func registerForNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(TargetNodeComponent.targetHit(notification:)), name: Notification.Name.EnemyDidHitPlayerNotification, object: nil)

    }
}
