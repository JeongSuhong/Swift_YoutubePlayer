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
import Kingfisher


class DetailVideoViewController : UIViewController{
    
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoDataLabel: UILabel!
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var channelThumbnail: UIImageView!
    @IBOutlet weak var subscriberCountLabel: UILabel!
    
   private var videoId = ""
   private var channelId = ""
    
    private let videoVM = VideosViewModel()
    private let channelVM = ChannelsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if videoId != "" && channelId != "" {
        
   let playerVars: [AnyHashable: Any] = [ "playsinline": 1 ]
            self.videoView.load(withVideoId: self.videoId, playerVars: playerVars)
            
            videoVM.delegate = self
            videoVM.FetchVideos(videoId: self.videoId)
            
            channelVM.delegate = self
            channelVM.FetchChannels(channelsId: self.channelId)
            
        }
    }
    
    func setData(videoId: String, channelId: String) {
        self.videoId = videoId
        self.channelId = channelId
    }
    
    @IBAction func closeScene(_ sender: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailVideoViewController : VideosProtocol {
    func VideosFetched() {
        if let video = videoVM.videos {
                   DispatchQueue.main.async {
            self.titleLabel.text = video.title
            }
        }
    }
    
    func VideosError(_ error: String) {
        print(error)
    }
}


extension DetailVideoViewController : ChannelsProtocol {
    func ChannelsFetched() {
        if let channel = channelVM.channel {
                   DispatchQueue.main.async {
            self.channelTitleLabel.text = channel.title
            let processor = RoundCornerImageProcessor(cornerRadius: 30)
            self.channelThumbnail.kf.setImage(with: channel.url, options: [.processor(processor)])
                self.subscriberCountLabel.text = "구독자수 \(channel.subscriberCount)"
            }
        }
    }
    
    func ChannelsError(_ error: String) {
         print(error)
    }
    
    
}
