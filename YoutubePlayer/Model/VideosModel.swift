//
//  VideosModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/01.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

struct VideosModel: Decodable {
    
    var id = ""
    var channelId = ""
    var title = ""
    var description = ""
    var thumnail = ""
    var channelTitle = ""
    var duration = ""
    var viewCount = ""
    var tags = [String]()
    var published = Date()
    
    // CodingKeys = JSON의 Key이름과 변수 이름을 다르게 사용하고 싶을때 쓰임.
    enum CodingKeys: String, CodingKey {
        case snippet
        case contentDetails
        case statistics
        case thumbnails
        case high
        
        case id
        case published = "publishedAt"
        case channelId
        case title
        case description
        case thumbnail = "url"
        case channelTitle
        case tags
        
        case duration
        
        case viewCount
    }
    
    // JSON에서 특정 키값이 내려오지 않았을때에 대한 예외처리
    init (from decoder: Decoder) throws {
    
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.channelId = try snippetContainer.decode(String.self, forKey: .channelId)
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        self.channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
        self.tags = try snippetContainer.decode([String].self, forKey: .tags)
        
        let contentDetailsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .contentDetails)
        self.duration = try contentDetailsContainer.decode(String.self, forKey: .duration)
        
        let statisticsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .statistics)
        self.viewCount = try statisticsContainer.decode(String.self, forKey: .viewCount)
     
        let thumnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let thumnailHighContainer = try thumnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumnail = try thumnailHighContainer.decode(String.self, forKey: .thumbnail)
    
    }
}
