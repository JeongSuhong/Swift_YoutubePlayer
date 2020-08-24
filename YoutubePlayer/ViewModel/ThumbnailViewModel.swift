//
//  ThumbnailViewModel.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/24.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

protocol ThumbanilViewModelProtocol {
    
    func thumbanilUpdated(_ thumbnail: Data)
}

class ThumbanilViewModel {
    
        var delegate: ThumbanilViewModelProtocol?
    
    func getThumbnail(_ urlStr: String)
       {
        let url = URL(string: urlStr)
           let session = URLSession.shared
        let dateTask = session.dataTask(with: url!) { (data, response, error) in
               
               if error == nil && data != nil {

                   DispatchQueue.global().async {
                    CacheManager.setVideoCache(url!.absoluteString, data)
                    self.delegate?.thumbanilUpdated(data!)
                   }
               }
           }
           
           dateTask.resume()
           }
}

