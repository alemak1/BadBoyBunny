//
//  NotificationNameExtension.swift
//  AlphabetPilot
//
//  Created by Aleksander Makedonski on 4/22/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import Foundation


extension Notification.Name{
    
    static let DidMakeContactNotification = Notification.Name(rawValue: "didMakeContactNotification")
    static let DidEndContactNotification = Notification.Name(rawValue: "didEndContactNotification")
    static let DidTouchPlayerNodeNotification = Notification.Name("didTouchPlayerNodeNotification")
    static let DidTouchScreenNotification = Notification.Name(rawValue: "didTouchScreenNotification")
    static let PlayerDidContactLetterNotification = Notification.Name(rawValue: "playerDidContactLetterNotification")
    static let PlayerStartedBarrierContactNotification = Notification.Name(rawValue: "playerStartedBarrierContactNotification")
    static let PlayerStoppedBarrierContactNotification = Notification.Name(rawValue: "playerStoppedBarrierContactNotification")
}
