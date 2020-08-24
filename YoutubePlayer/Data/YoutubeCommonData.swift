//
//  YoutubeData.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation

// 나중에 plist 로 수정할것!!
class YoutubeCommonData {
    
    static var API_KEY = "AIzaSyC3Ne1DOjfoil-EwIMDvjq6w0J0NWgRltk"
    static var PLAYLIST_ID = "PLis5WuyWOdrXqtkDLGwVeqzNzkr16gdHL"
    // part에서 snippet 추가시 title, description 등 하위데이터를 포함한 반환값을 돌려줌.
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(YoutubeCommonData.PLAYLIST_ID)&key=\(YoutubeCommonData.API_KEY)"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    
    
}
