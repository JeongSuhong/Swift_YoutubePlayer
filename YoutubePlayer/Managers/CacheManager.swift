//
//  CacheManager.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/06.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        return cache[url]
         
    }
}
