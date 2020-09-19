//
//  DetailVideoViewController.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/19.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit
import youtube_ios_player_helper


class DetailVideoViewController : UIViewController{
    
    @IBOutlet weak var videoView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   let playerVars: [AnyHashable: Any] = [
       "playsinline": 1
   ]
        self.videoView.load(withVideoId: "PXAf5cQUFN0", playerVars: playerVars)
    }
}
