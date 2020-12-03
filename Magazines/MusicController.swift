//
//  MusicController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/25/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
class MusicController: UIViewController {
    let URL_UPDATE = "http://localhost:3306/update/"
    var about = [String]()
    var int1: Int?
    var int2: Int?
    var int3: Int?
    var sc = 0
    var op = ["+","x","-"]
    @IBOutlet weak var nmb1: UILabel!
    @IBOutlet weak var nmb2: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var answer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        initgame()
        fetsh()
        username.text = about[0]
        score.text = String(sc)
    }
    @IBAction func apply(_ sender: Any) {
        if(int1!+int2!==Int(answer.text!)){
            sc = sc + 1
        let parameters: Parameters=[
            "username":about[0],
            "score":String(sc),
            
        ]
        
        //Sending http post request
        Alamofire.request(URL_UPDATE, method: .post, parameters: parameters).responseJSON
        {
            response in
            
            print(response)
            
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
                
                
              
                
            }
        }
            score.text = String(sc)
            answer.text = ""
            let alert = UIAlertController(title: "Win", message: "You Win ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Lost", message: "Try again ", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert,animated: true,completion: nil)
        }
        initgame()
    }
    
    func initgame(){
        int1=Int(arc4random_uniform(10)+1)
        int2=Int(arc4random_uniform(10)+1)
        
        
        if(int1! > int2!){
            nmb1.text = String(int1!)
            nmb2.text = String(int2!)
        }
        else{
            nmb1.text = String(int2!)
            nmb2.text = String(int1!)
        }
        
    }
    
    func fetsh(){
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
              let persistentContainer = appDelegate.persistentContainer
              let managedContext = persistentContainer.viewContext
              let fetchRequest2 = NSFetchRequest<NSManagedObject>(entityName: "About")
                  do{
                       let result2 = try managedContext.fetch(fetchRequest2)
                       
                           for match in result2{
                               about.append(match.value(forKey: "about") as! String)
                               print(match.value(forKey: "about") as! String)
                           }
                           
                         
                     }catch let error as NSError{
                         print(error.userInfo)
                     }
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


