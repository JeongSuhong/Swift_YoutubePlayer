//
//  ChannelThumbnailViewModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/15.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

protocol ChannelThumbnailProtocol {
    func channelThubmanilFetched(_ thumbnail: URL)
    func channelThubmanilError(_ error: String)
}

class ChannelThumbnailViewModel {
 
    var delegate: ChannelThumbnailProtocol?
    
    init(_ id: String) {
          let DTO = YoutubeDTO()
        guard let url = URL(string: DTO.getChannelThumbnail(channelId: id)) else { return }
        print(url)
          let session = URLSession.shared
          session.dataTask(with: url, completionHandler: { (data, response, error) in
        
              if error != nil || data == nil { return }
              
              do {
              
              let decoder = JSONDecoder()
              let model = try decoder.decode(ChannelThumbnailModel.self, from: data!)
 
                self.delegate?.channelThubmanilFetched(model.thumbanil.url)
                
                } catch {
                    self.delegate?.channelThubmanilError(error.localizedDescription)
                 }
                 
                 }).resume()
    }
}
