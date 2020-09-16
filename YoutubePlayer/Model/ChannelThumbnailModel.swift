//
//  ChannelThumbnailModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/15.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation


struct ChannelThumbnailModel: Decodable {
    
        var thumbanil: channelThumbnail
        
        enum CodingKeys: String, CodingKey {
            case items
        }
        
        init (from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let thumbnails =  try container.decode([channelThumbnail].self, forKey: .items)
            self.thumbanil = thumbnails[0]
        }
    }


struct channelThumbnail: Decodable {
    
    let url: URL
    
    enum CodingKeys: String, CodingKey {
       case snippet

        case thumbnails
        case defaultThumbnail = "default"
        case url
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
             
        let snippetContainer =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let defaultThumbContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .defaultThumbnail)
        self.url = try defaultThumbContainer.decode(URL.self, forKey: .url)
    }

}
