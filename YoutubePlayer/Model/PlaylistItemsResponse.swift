//
//  YoutubeResponse.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/05.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation


// Response 파일 나중에 정리하기. 좀더 깔끔하게 할 방법 없나??
struct PlaylistItemsResponse : Decodable {
    
    var items: [PlaylistItemsModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([PlaylistItemsModel].self, forKey: .items)
    }
    
}
