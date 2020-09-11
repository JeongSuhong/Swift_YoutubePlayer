//
//  YoutubeData.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

class YoutubeDTO {
    
    private final let apiKey = Bundle.main.infoDictionary?["API_KEY"] as! String
    private final let mainPlaylistId = Bundle.main.infoDictionary?["MAIN_PLAYLIST_ID"] as! String
    private final let youtubeBaseURL = Bundle.main.infoDictionary?["YOUTUBE_URL"] as! String
    
    private final let playItemsURL = "playlistItems"
    private final let videosURL = "videos"
    
//    static var MAIN_PLAYLISE_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(self.mainPlaylistId)&key=\(self.apiKey)"
//
//
//    static func getVideosApiUrl(_ videosId: String) -> String
//    {
//        return "https://www.googleapis.com/youtube/v3/videos?part=snippet,contentDetails,statistics&id=\(videosId)&regionCode=kr&key=\(self.apiKey)"
//    }
    
}
