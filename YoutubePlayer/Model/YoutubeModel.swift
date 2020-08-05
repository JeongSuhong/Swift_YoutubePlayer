//
//  YoutubeModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/07/27.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videoFetched(_ videos: [YoutubeVideoData])
}

class YoutubeModel {
    
    var delegate: ModelDelegate?
    
    func getVideos(){
        guard let url = URL(string: YoutubeCommonData.API_URL) else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {(data, responce, error) in
            
            if error != nil || data == nil { return }
            
            do {
                
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(YoutubeResponse.self, from: data!)
            
            // dump = print 보다 더 상세한 Log 출력
            dump(response)
                
                if response.items != nil {
                    
                    // DispatchQueue = 해당 Task를 처리하는 Thread 와 관련된 class
                    DispatchQueue.global().async {
                        self.delegate?.videoFetched(response.items!)
                    }
                }
                
            } catch {
                
            }
            
             }
        
             dataTask.resume()

    }
}
