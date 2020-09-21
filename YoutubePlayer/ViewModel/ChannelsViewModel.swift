//
//  ChannelsViewModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/21.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation


protocol ChannelsProtocol {
    func ChannelsFetched()
    func ChannelsError(_ error: String)
}

class ChannelsViewModel {

var delegate: ChannelsProtocol?

var channel: channelsData?

    func FetchChannels(channelsId: String) {
    let DTO = YoutubeDTO()
    guard let url = URL(string: DTO.getChannelData(channelId: channelsId)) else { return }
    let session = URLSession.shared
    session.dataTask(with: url, completionHandler: { (data, response, error) in
  
        if error != nil || data == nil { return }
        
        do {
        
        let decoder = JSONDecoder()
        let model = try decoder.decode(ChannelsModel.self, from: data!)
            self.channel = model.channel
        
            self.delegate?.ChannelsFetched()
            
            
        } catch {
            self.delegate?.ChannelsError(error.localizedDescription)
        }
        
        }).resume()
    
}
}
