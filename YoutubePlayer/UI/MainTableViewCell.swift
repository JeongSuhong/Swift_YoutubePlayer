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
    
    
    func updateCell(_ data: playlistItems) {
        
        thumbnailImageView.kf.setImage(with: data.thumbnailURL)
        titleLabel.text = data.title
        dateLabel.text = data.publishedAt
    
    }
 
}
