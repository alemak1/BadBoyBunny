//
//  HealthComponent.swift
//  Badboy Bunny Saves the Alphabet
//
//  Created by Aleksander Makedonski on 4/25/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit


class HealthComponent: GKComponent{
    
    
    let startingHealth: Int
    var currentHealth: Int
    
    init(startingHealth: Int){
        self.startingHealth = startingHealth
        self.currentHealth = startingHealth
        super.init()
        
        //TODO: Add observer to NotificationCenter for damage notification
        
        NotificationCenter.default.addObserver(self, selector: #selector(HealthComponent.playerTakesDamage(notification:)), name: Notification.Name.PlayerDidTakeDamageNotification, object: nil)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** Called when the player has contact with a colliding/non-colliding enemy or a hostile barrier/object entity (i.e. spikes, fire, etc.) ; the level of damage may vary based on the specific enemy causing the damage, which can be ascertained from the notifications userInfo dictionary
 
    **/
    func playerTakesDamage(notification: Notification){
        currentHealth -= 1
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
