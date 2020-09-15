//
//  VideoTableViewCell.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/05.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var channelThumbnailImageView: UIImageView!
    @IBOutlet weak var playTimeLabel: UITextField!
    
    var channelThumbnailVM: ChannelThumbnailViewModel?
    
    func updateCell(_ data: playlistItems) {
        
        thumbnailImageView.kf.setImage(with: data.thumbnailURL)
        titleLabel.text = data.title
        dateLabel.text = data.publishedAt
    
        self.channelThumbnailVM = ChannelThumbnailViewModel(data.channelId)
        self.channelThumbnailVM?.delegate = self
    }
 
}


extension MainTableViewCell: ChannelThumbnailProtocol {
    
    func channelThubmanilFetched(_ thumbnail: URL) {
        
        self.channelThumbnailImageView.kf.setImage(with: thumbnail)
        
        self.channelThumbnailVM?.delegate = nil
        self.channelThumbnailVM = nil
    }
    
    func channelThubmanilError(_ error: String) {
        print(error)
    }
}
