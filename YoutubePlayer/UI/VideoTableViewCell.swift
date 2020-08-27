//
//  VideoTableViewCell.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/05.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var channelThumbnailImageView: UIImageView!
    @IBOutlet weak var playTimeLabel: UITextField!
    
    var videoData: PlaylistItemsModel?
    
    let thumbnailVM = ThumbanilViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        thumbnailVM.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ video: PlaylistItemsModel) {
        
        self.videoData = video
        guard self.videoData != nil else { return }
        
        self.titleLabel.text = videoData?.title
        
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMM, d, yyyy"
        self.dateLabel.text = format.string(from: videoData!.published)
        
        guard self.videoData?.thumnail != nil else { return }
        
        if let cache = CacheManager.getVideoCache(self.videoData!.thumnail) {
            self.thumbnailImageView.image = UIImage(data: cache)
        } else {
            self.thumbnailVM.getThumbnail(self.videoData!.thumnail)
        }
    }
}

// MARK - Thumbnail View Model Protocol
extension VideoTableViewCell : ThumbanilViewModelProtocol {
    
    func thumbanilUpdated(_ thumbnail: Data) {
        DispatchQueue.main.async {
         self.thumbnailImageView.image = UIImage(data: thumbnail)
        }
    }
    
}
