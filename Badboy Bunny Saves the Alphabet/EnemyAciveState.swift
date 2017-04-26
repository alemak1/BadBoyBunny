//
//  AlienActiveState.swift
//  Badboy Bunny Saves the Alphabet
//
//  Created by Aleksander Makedonski on 4/26/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

/** Player enter the attacking state when the intelligence component, which manages the entity-levels state machines receives a notification that the player has entered the enemy's proximity zone
 
 
 **/

class EnemyActiveState: GKState{
    
    let enemyEntity: Enemy
    
    init(enemyEntity: Enemy) {
        self.enemyEntity = enemyEntity
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        print("Enemy has entered the active state...")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)

        if let targetNodeComponent = enemyEntity.component(ofType: TargetNodeComponent.self), targetNodeComponent.playerHasEnteredProximity{
                stateMachine?.enter(EnemyAttackState.self)

        }
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        super.isValidNextState(stateClass)
        switch(stateClass){
            case is EnemyAttackState.Type:
                return true
            default:
                return false
        }
        return false
    }
}
