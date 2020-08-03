//
//  MainViewController.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/07/29.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    var youtubeModel = YoutubeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youtubeModel.getVideos()
    }
}
