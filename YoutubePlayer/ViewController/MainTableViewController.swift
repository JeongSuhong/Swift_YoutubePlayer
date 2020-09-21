//
//  MainViewController.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/07/29.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewController : UITableViewController {
    
    private let vm = PlaylistItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let cell = sender as? UITableViewCell {
             if let detailVC = segue.destination as? DetailVideoViewController {
                if let indexPath = self.tableView.indexPath(for: cell) {
                    if let data = vm.getItemData(rowIndex: indexPath.row) {
                    detailVC.setData(videoId: data.videoId, channelId: data.channelId)
                    }
                 }
             }
         }
     }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getDataCount() + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIVO.mainVideoCellName, for: indexPath) as! MainTableViewCell
        guard let data = vm.getItemData(rowIndex: indexPath.row) else {
            return cell
        }
        
        cell.updateCell(data)
        
        return cell
    }

    
}



extension MainTableViewController : PlaylistItemsProtocol {
    
    func playlistItemsFetched() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func playlistItemsError(_ error: String) {
        print(error)
        
    }
    
    
}
