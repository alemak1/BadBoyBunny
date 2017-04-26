//
//  IntelligenceComponent.swift
//  Badboy Bunny Saves the Alphabet
//
//  Created by Aleksander Makedonski on 4/26/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class IntelligenceComponent: GKComponent{
    
    var stateMachine: GKStateMachine?
    var notificationObserverQueue = OperationQueue()
    
    init(states: [GKState]) {
        
        stateMachine = GKStateMachine(states: states)
        super.init()
        
        registerHandlerForPlayerProximityNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
    
    
    func registerHandlerForPlayerProximityNotifications(){
        
        NotificationCenter.default.addObserver(forName: Notification.Name.PlayerEnteredEnemyProximityNotification, object: nil, queue: notificationObserverQueue, using: {
            
            notification in
            
            if let userInfo = notification.userInfo, let senderName = userInfo["enemyNodeName"] as? String, let receiverName = self.entity?.component(ofType: NodeNameComponent.self)?.nodeName {
                
                guard receiverName == senderName else { return }
                
                self.stateMachine?.enter(EnemyAttackState.self)
                
            }
            
        })
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.PlayerExitedEnemyProximityNotification, object: nil, queue: notificationObserverQueue, using: {
        
            notification in
            
            if let userInfo = notification.userInfo, let senderName = userInfo["enemyNodeName"] as? String, let receiverName = self.entity?.component(ofType: NodeNameComponent.self)?.nodeName {
                
                guard receiverName == senderName else { return }
                
                self.stateMachine?.enter(EnemyActiveState.self)
                
            }
            
        })
        
    }
    
    
}
