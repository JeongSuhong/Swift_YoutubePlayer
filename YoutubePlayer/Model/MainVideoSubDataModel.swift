//
//  MainVideoSubDataModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/09/16.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation


struct MainVideoSubDataModel: Decodable {

    var subData: mainVideoSubData
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let subDatas =  try container.decode([mainVideoSubData].self, forKey: .items)
        self.subData = subDatas[0]
    }
}


struct mainVideoSubData: Decodable {
    
    let duration: String
    let viewCount: String
    
    enum CodingKeys: String, CodingKey {
       case contentDetails
        case statistics
        
        case duration
        case viewCount
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
             
        let contentDetailsContainer =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .contentDetails)
        self.duration = try contentDetailsContainer.decode(String.self, forKey: .duration)
        let statisticsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .statistics)
        self.viewCount = try statisticsContainer.decode(String.self, forKey: .viewCount)
    }

}
