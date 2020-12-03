//
//  GamesController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/25/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import AVFoundation
class GamesController: UIViewController,AVAudioPlayerDelegate {
    var x: Int?
    var name: String?
    var player:AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func play(_ sender: Any) {
        do {
            x=Int(arc4random_uniform(7)+1)
            if (x==1){
                name="black"
            }
            if (x==2){
                name="blue"
            }
            if (x==3){
                name="green"
            }
            if (x==4){
                name="orange"
            }
            if (x==5){
                name="purple"
            }
            if (x==6){
                name="red"
            }
            if (x==7){
                name="yellow"
            }
            let audioPlayer = Bundle.main.path(forResource: name, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!)as URL)
        }
        catch{
            
        }
        player.play()
    }
    
    @IBAction func black(_ sender: Any) {
        if(name=="black"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    @IBAction func blue(_ sender: Any) {
        if(name=="blue"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    @IBAction func red(_ sender: Any) {
        if(name=="red"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    @IBAction func yellow(_ sender: Any) {
        if(name=="yellow"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    @IBAction func purple(_ sender: Any) {
        if(name=="purple"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    @IBAction func green(_ sender: Any) {
        if(name=="green"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    @IBAction func orange(_ sender: Any) {
        if(name=="orange"){
            let alert = UIAlertController(title: "Victory", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try Again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
