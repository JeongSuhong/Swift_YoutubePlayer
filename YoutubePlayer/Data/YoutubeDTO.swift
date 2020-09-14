//
//  YoutubeData.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

class YoutubeDTO {
    
    final let mainPlaylistId = Bundle.main.infoDictionary?["MAIN_PLAYLIST_ID"] as! String
    
    private final let apiKey = Bundle.main.infoDictionary?["API_KEY"] as! String
    private final let youtubeBaseURL = Bundle.main.infoDictionary?["YOUTUBE_URL"] as! String
    
    private final let playlistItemsURL = "playlistItems"
    private final let videosURL = "videos"
    

    func getPlayItemsSnippet(playlistId: String) -> String {
        return "\(youtubeBaseURL)\(playlistItemsURL)?part=snippet&playlistId=\(playlistId)&key=\(apiKey)"
    }
    
    // 국가 코드는 나중에 기기 국가로 바꿀수 있도록
    func getVideosDetail(id: String) -> String {
        return "\(youtubeBaseURL)\(videosURL)?part=snippet,contentDetails,statistics&id=\(id)&regionCode=kr&key=\(apiKey)"
    }
}
