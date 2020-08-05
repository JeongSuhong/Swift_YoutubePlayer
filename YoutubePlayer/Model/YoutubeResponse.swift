//
//  YoutubeResponse.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/05.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

struct YoutubeResponse : Decodable {
    
    var items: [YoutubeVideoData]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([YoutubeVideoData].self, forKey: .items)
    }
    
}
