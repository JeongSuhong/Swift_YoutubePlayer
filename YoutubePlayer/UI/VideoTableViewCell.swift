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
    
    var playlistItemData: PlaylistItemsModel?
    var videosData: VideosModel?
    
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
        
        self.playlistItemData = video
        guard self.playlistItemData != nil else { return }
        
        self.titleLabel.text = playlistItemData?.title
        
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMM, d, yyyy"
        self.dateLabel.text = format.string(from: playlistItemData!.published)
        
        guard self.playlistItemData?.thumnail != nil else { return }
        
        if let cache = CacheManager.getVideoCache(self.playlistItemData!.thumnail) {
            self.thumbnailImageView.image = UIImage(data: cache)
        } else {
            self.thumbnailVM.getThumbnail(self.playlistItemData!.thumnail)
        }
    }
    
    func updateCell(_ videos: VideosModel) {
        
        self.videosData = videos
        
        self.playTimeLabel.text = self.videosData?.duration
        self.dateLabel.text = "\(self.videosData?.channelTitle ?? "") * 조회수 \(self.videosData?.viewCount ?? "")"
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
