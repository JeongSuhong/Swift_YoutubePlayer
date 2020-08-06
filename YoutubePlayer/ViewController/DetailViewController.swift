//
//  DetailViewController.swift
//  YoutubePlayer
//
//  Created by Suhong Jeong on 2020/08/06.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: YoutubeVideoData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else { return }
        
        let embedUrlString = YoutubeCommonData.YT_EMBED_URL + video!.videoId
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = video!.title
        
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMM, d, yyyy"
        self.dateLabel.text = format.string(from: video!.published)
        
        textView.text = video!.description
        
    }

}
