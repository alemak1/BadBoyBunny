//
//  GameViewController.swift
//  AlphabetPilot
//
//  Created by Aleksander Makedonski on 4/21/17.
//  Copyright © 2017 AlexMakedonski. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    let mainMotionManager = MainMotionManager.sharedMotionManager

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        mainMotionManager.startDeviceMotionUpdates()
        mainMotionManager.deviceMotionUpdateInterval = 0.50
        
        
        let skView = self.view as! SKView
            
        let baseScene = BaseScene(size: view.bounds.size)
        let platformerBaseScene = PlatformerBaseScene(size: view.bounds.size)
        
        skView.presentScene(platformerBaseScene)
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
