//
//  StoriesController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/25/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import Alamofire

class StoriesController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var leaderboard:[[String:Any]] = [[String:Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leader")
        
        let contentView = cell?.viewWithTag(0)
        
        let username = contentView?.viewWithTag(1) as! UILabel
        
        let score = contentView?.viewWithTag(2) as! UILabel
        
       // let leaders = leaderboard[indexPath.row]
        if self.leaderboard.count > 0{
            let eachrank = self.leaderboard[indexPath.row]
            username.text = (eachrank["username"] as! String)
            score.text = String((eachrank["score1"] as! Int) )
        }
        
        
        
        
        return cell!
    }
    
    func fetchLeaderBoard(){
        
        Alamofire.request("http://localhost:3306/rank/").responseJSON{
            
            response in
            
            
            
            print(response.result.value)
            if let responseValue = response.result.value as! [String:Any]? {
                if let responseRank = responseValue["result"] as! [[String:Any]]? {
                    self.leaderboard = responseRank
                     self.tableView.reloadData()
                }
            }
            // self.leaderboard = response.result.value as! NSDictionary
            
           
            
        }
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLeaderBoard()
        // Do any additional setup after loading the view.
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
