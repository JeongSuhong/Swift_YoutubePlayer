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
    
    @IBOutlet weak var tableView: UITableView!
    
    var youtubeModel = YoutubeModel()
    var youtubeVideos = [YoutubeVideoData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        youtubeModel.delegate = self
        youtubeModel.getVideos()
    }
}

    // MARK: - Table view
    extension MainViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return youtubeVideos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: UIData.YOUTUBE_VIDEO_CELL_ID, for: indexPath)
            cell.textLabel?.text = self.youtubeVideos[indexPath.row].title
            
            return cell
        }
}

extension MainViewController: UITableViewDelegate {
    
}


    // MARK: - Video Delegate
extension MainViewController: ModelDelegate {
    
    func videoFetched(_ videos: [YoutubeVideoData]) {
        self.youtubeVideos = videos
        tableView.reloadData()
    }

}
