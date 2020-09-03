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
    
    var youtubeVM = YoutubeViewModel()
    
    // Model Data 나중에 통함 & vidoe Data Manager 생성 필요
    var playlistItems = [PlaylistItemsModel]()
    var videoItems = [String : VideosModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        youtubeVM.delegate = self
        youtubeVM.getPlaylistItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        guard tableView.indexPathForSelectedRow != nil else { return }
        
        let selectedVideo = playlistItems[tableView.indexPathForSelectedRow!.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.video = selectedVideo
    }
}

    // MARK: - Table view
    extension MainViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return playlistItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: UIData.YOUTUBE_VIDEO_CELL_ID, for: indexPath) as! VideoTableViewCell
            cell.setCell(playlistItems[indexPath.row])
            
            let videos = videoItems[playlistItems[indexPath.row].videoId]
            if videos != nil {
                cell.updateCell(videos!)
            }
            
            return cell
        }
}


    // MARK: - Video Delegate
extension MainViewController: YoutubeViewModelProtocol {
    
    func playlistItemsFetched(_ videos: [PlaylistItemsModel]) {
        self.playlistItems = videos
        
        for video in self.playlistItems {
            self.youtubeVM.getVideos(video.videoId)
        }
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func videoFetched(_ videos: [VideosModel]) {
        self.videoItems.updateValue(videos[0], forKey: videos[0].id)
        
        // test code.
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
