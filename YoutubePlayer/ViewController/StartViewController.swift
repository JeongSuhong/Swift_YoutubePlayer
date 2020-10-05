//
//  StartViewController.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/10/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class StartViewController : UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        
        
    }
}
