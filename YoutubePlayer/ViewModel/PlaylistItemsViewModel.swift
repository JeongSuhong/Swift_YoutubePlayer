//
//  PlaylistItemsViewModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/14.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

protocol PlaylistItemsProtocol {
    func playlistItemsFetched()
    func playlistItemsError(_ error: String)
}

class PlaylistItemsViewModel {
    
    var delegate: PlaylistItemsProtocol?
    
    var items: [playlistItems] = [playlistItems]()
    
    init() {
        let DTO = YoutubeDTO()
        guard let url = URL(string: DTO.getPlayItemsSnippet(playlistId: DTO.mainPlaylistId)) else { return }
        let session = URLSession.shared
        session.dataTask(with: url, completionHandler: { (data, response, error) in
      
            if error != nil || data == nil { return }
            
            do {
            
            let decoder = JSONDecoder()
            let model = try decoder.decode(PlaylistItemsModel.self, from: data!)
            self.items = model.items
            
            self.delegate?.playlistItemsFetched()
                
                
            } catch {
                self.delegate?.playlistItemsError(error.localizedDescription)
            }
            
            }).resume()
        
    }
    
    func getItemData(rowIndex: Int) -> playlistItems? {
        guard rowIndex < items.count else {
            return nil
        }
        
        return items[rowIndex]
    }
    
    func getDataCount() -> Int {
        return items.count
    }
    
}
