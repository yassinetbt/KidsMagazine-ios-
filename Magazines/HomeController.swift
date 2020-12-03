//
//  HomeController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/25/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
class HomeController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    let URL_QUIZ = "http://localhost:3306/insert/"
    var about = [String]()
    var nom:String?
    var nomx:String = ""
    
    let labs = ["Game","Leader Board","Videos","Quiz","Drawing"]
    
    let images = ["1","2","3","4","5",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="HOME"
        self.fetsh()
        // Do any additional setup after loading the view.
    }
    @IBAction func SignOut(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonn")
        
        let contentView = cell?.viewWithTag(0)
        
        let imgbutt = contentView?.viewWithTag(1) as! UIImageView
        
        let labbutt = contentView?.viewWithTag(2) as! UILabel
        
        labbutt.text = labs[indexPath.row]
        
        imgbutt.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row==0){
        performSegue(withIdentifier: "toGame", sender: indexPath)
        }
        if(indexPath.row==1){
        performSegue(withIdentifier: "toLeader", sender: indexPath)
        }
        if(indexPath.row==2){
        performSegue(withIdentifier: "toVideo", sender: indexPath)
        }
        if(indexPath.row==3){
        performSegue(withIdentifier: "toQuiz", sender: indexPath)
        }
        if(indexPath.row==4){
        performSegue(withIdentifier: "toDrawing", sender: indexPath)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = sender as! IndexPath
        
        let indice = indexPath.row
        if (indice==3){
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DvC = Storyboard.instantiateViewController(identifier: "MusicController") as! MusicController
            let parameters: Parameters=[
                "username":about[0],
                "score":about[0],
                
            ]
            
            //Sending http post request
            Alamofire.request(URL_QUIZ, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response)
                
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! String
                    
                    
                  
                    
                }
            }
            
            
        }
        
    }
    
    
    
    @IBAction func books(_ sender: Any) {
        
    }
    
    @IBAction func drawingbooks(_ sender: Any) {
    }
    
    @IBAction func quiz(_ sender: Any) {
        
    }
    
    @IBAction func videos(_ sender: Any) {
    }
    
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    
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
