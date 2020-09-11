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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
