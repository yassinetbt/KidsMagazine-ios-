//
//  VideoViewController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/28/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    var video:Video = Video()
    @IBOutlet weak var videowebview: WKWebView!
    @IBOutlet weak var videotitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(video.Title)
        videotitle.text = video.Title
        getVideo(videoKey: video.Key)
        // Do any additional setup after loading the view.
    }
    
    func getVideo(videoKey:String) {
        
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        videowebview.load(URLRequest(url: url!))
        
    }
    

  

}
