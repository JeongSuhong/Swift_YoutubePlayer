//
//  MainViewController.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/07/29.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UITableViewController {
    
    private let vm = PlaylistItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIVO.mainVideoCellName, for: indexPath) as! MainTableViewCell
        
        return cell
    }
}



extension MainViewController : PlaylistItemsProtocol {
    
    func playlistItemsFetched(_ data: PlaylistItemsModel) {
        dump(data.items[0])
    }
    
    func playlistItemsError(_ error: String) {
        print(error)
        
    }
    
    
}
