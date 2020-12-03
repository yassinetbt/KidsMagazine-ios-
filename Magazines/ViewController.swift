//
//  ViewController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/25/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class ViewController: UIViewController{
    
    
    
    let URL_LOGIN = "http://localhost:3306/login/"
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title="TOONS WORLD"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }

    @IBAction func cancel(_ sender: Any) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "HomeController") as! HomeController
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        self.log()
       
    }
    @IBAction func register(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "RegisterController") as! RegisterController
        self.navigationController?.pushViewController(DvC, animated: true)
        
    }
    
    func log(){
        if(username.text! != "" && password.text! != ""){
        let parameters: Parameters=[
                   
                   "username":username.text!,
                   "password":password.text!
               ]
               Alamofire.request(URL_LOGIN, method: .post, parameters: parameters).responseJSON
               {
                   response in
                   print(response)
                   
                   if let result = response.result.value {
               
                       
                       let jsonData = result as! String
                      
                       if (response.description == "SUCCESS: login succes"){
                           let Storyboard = UIStoryboard(name: "Main", bundle: nil)
                           let DvC = Storyboard.instantiateViewController(identifier: "HomeController") as! HomeController
                           self.remove()
                           self.add()
                           self.navigationController?.pushViewController(DvC, animated: true)
                       }
                       else{
                           let alert = UIAlertController(title: "Alert", message: "Please verify fields ", preferredStyle: .alert)
                           
                           let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                           
                           alert.addAction(action)
                           
                           self.present(alert,animated: true,completion: nil)
                       }
                       
                     
                       
                   }
               }
        }
    }
    
    func add(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let persistentContainer = appDelegate.persistentContainer
        
        let managedContext = persistentContainer.viewContext
        
        
        let AboutEntityDescription = NSEntityDescription.entity(forEntityName: "About", in: managedContext)
        let about = NSManagedObject(entity: AboutEntityDescription!, insertInto: managedContext)
        
        
        about.setValue(username.text, forKey: "about")
        do{
                   
                   try  managedContext.save()
                   
                   
               }catch let error as NSError{
                   
                   print(error.userInfo)
               }
        
    }
    
    func remove(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "About")
        do{
        let result = try managedContext.fetch(fetchRequest)
        
            for match in result{
              
                managedContext.delete(match)
                }
            }
            
            
            catch let error as NSError{
                print(error.userInfo)
            }
}
    
}

