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
    
    var videoData: YoutubeVideoData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ video: YoutubeVideoData) {
        
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
        
        let url = URL(string: self.videoData!.thumnail)
        let session = URLSession.shared
        let dateTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.videoData!.thumnail { return }
                
                let thumbnail = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = thumbnail
                }
            }
        }
        
        dateTask.resume()
        }
    }

}
