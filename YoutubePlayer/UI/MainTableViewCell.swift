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
    
    private var channelThumbnailVM: ChannelThumbnailViewModel?
    private var mainVideoSubDataVM: MainVideoSubDataViewModel?
    
    func updateCell(_ data: playlistItems) {
        
        thumbnailImageView.kf.setImage(with: data.thumbnailURL)
        titleLabel.text = data.title
        
        // ViewModel 로 이동
        let formatter = ISO8601DateFormatter()
        let publishedDate = formatter.date(from: data.publishedAt)!
        let calendar = Calendar.current
        let interval = calendar.dateComponents([.year,.month,.day,.hour], from: publishedDate, to: Date.init())
        var time = ""
        
        if interval.year! > 0 {
            time = "\(interval.year!)년 전"
        } else if interval.month! > 0 {
            time = "\(interval.month!)개월 전"
        } else if interval.day! > 0 {
            time = "\(interval.day!)일 전"
        } else if interval.hour! > 0 {
            time = "\(interval.hour!)시간 전"
        } else {
            time = "방금 전"
        }
        
        dateLabel.text = "\(data.channelTitle) * \(time)"
    
        self.channelThumbnailVM = ChannelThumbnailViewModel(data.channelId)
        self.channelThumbnailVM?.delegate = self
        
        self.mainVideoSubDataVM = MainVideoSubDataViewModel(data.videoId)
        self.mainVideoSubDataVM?.delegate = self
        
    }
 
}


extension MainTableViewCell: ChannelThumbnailProtocol {
    
    func channelThubmanilFetched(_ thumbnail: URL) {
    
        let processor = RoundCornerImageProcessor(cornerRadius: 30)
        channelThumbnailImageView.kf.setImage(with: thumbnail, options: [.processor(processor)])
        
        self.channelThumbnailVM?.delegate = nil
        self.channelThumbnailVM = nil
    }
    
    func channelThubmanilError(_ error: String) {
        print(error)
    }
}


extension MainTableViewCell: MainVideoSubDataProtocol {
    func MainVideoSubDataFetched(_ data: mainVideoSubData) {

        DispatchQueue.main.async {
            var durationDate = data.duration.replacingOccurrences(of: "M", with: ":")
            durationDate = durationDate.replacingOccurrences(of: "PT", with: "")
            durationDate = durationDate.replacingOccurrences(of: "S", with: "")
            self.playTimeLabel.text = durationDate
            
            self.dateLabel.text = "\(self.dateLabel.text!) * 조회수 \(data.viewCount)"
        }
        self.mainVideoSubDataVM?.delegate = nil
        self.mainVideoSubDataVM = nil
    }
    
    func MainVideoSubDataError(_ error: String) {
        print(error)
    }
    
    
}
