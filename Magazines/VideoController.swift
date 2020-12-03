//
//  VideoController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/28/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit

class VideoController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var videos:[Video] = []
    var video:Video = Video()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        cell.videoTitle.text = videos[indexPath.row].Title
        let url = "https://img.youtube.com/vi/\(videos[indexPath.row].Key)/0.jpg"
        cell.videoImage.downloaded(from: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vi = videos[indexPath.row]
        self.video = vi
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "VideoViewController") as! VideoViewController
        DvC.video = self.video
        self.navigationController?.pushViewController(DvC, animated: true)
        
    }
    
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let video = Video()
        video.Key = "ZzAm13KsBCc"
        video.Title = "Baby Song"
        videos.append(video)
        
        let video2 = Video()
        video2.Key = "sJJk3maVzvA"
        video2.Title = "Tom And Jerry"
        videos.append(video2)
        
        
        let video4 = Video()
        video4.Key = "EajCJ5jjk6E"
        video4.Title = "Shaun The Sheep"
        videos.append(video4)
        
        let video5 = Video()
        video5.Key = "0bKVpc8U2go"
        video5.Title = "Sponge Bob"
        videos.append(video5)
        
        let video6 = Video()
        video6.Key = "adB_rHnPRv0"
        video6.Title = "Lazy Town"
        videos.append(video6)
        
        
        
        
    }
    
    

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
