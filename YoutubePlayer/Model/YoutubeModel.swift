//
//  YoutubeModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/07/27.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

class YoutubeModel {
    
    func getVideos() {
        guard let url = URL(string: YoutubeCommonData.API_URL) else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {(data, responce, error) in
            
            if error != nil || data == nil { return }
            
            guard let jsonToArray = try? JSONSerialization.jsonObject(with: data!) else {
                     print("json to Any Error")
                     return
                 }
            
                 print(jsonToArray)
             }
             dataTask.resume()

    }
}
