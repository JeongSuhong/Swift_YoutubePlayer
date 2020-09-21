//
//  VideosModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/21.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation


struct VideosModel: Decodable {

    var video: videosData
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let subDatas =  try container.decode([videosData].self, forKey: .items)
        self.video = subDatas[0]
    }
}


struct videosData: Decodable {
    
    let title: String
    let description: String
    let channelTitle: String
    
    enum CodingKeys: String, CodingKey {
       case snippet
        case title
        case description
        case channelTitle
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
             
        let snippetContainer =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
    }

}
