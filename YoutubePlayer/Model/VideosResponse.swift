//
//  VideosResponse.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

struct VideosResponse : Decodable {
    
    var items: [VideosModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([VideosModel].self, forKey: .items)
    }
    
}
