//
//  YoutubeVideoData.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

struct YoutubeVideoData: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumnail = ""
    var published = Date()
    
    // CodingKeys = JSON의 Key이름과 변수 이름을 다르게 사용하고 싶을때 쓰임.
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    // JSON에서 특정 키값이 내려오지 않았을때에 대한 예외처리
    init (from decoder: Decoder) throws {
    
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // nestedContainer = JSON이 중첩된 구조를 가지고 있을경우 내부 구조에 대한 컨테이너 추가 생성
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
     
        let thumnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let thumnailHighContainer = try thumnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumnail = try thumnailHighContainer.decode(String.self, forKey: .thumbnail)
        
        let videoIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try videoIdContainer.decode(String.self, forKey: .videoId)
    }
}
