//
//  RegisterController.swift
//  Magazines
//
//  Created by Taboubi Khaled on 11/25/19.
//  Copyright © 2019 Taboubi Yassine. All rights reserved.
//

import UIKit
import Alamofire



class RegisterController: UIViewController {
    let URL_USER_REGISTER = "http://localhost:3306/register/"
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var datenn: UIDatePicker!
    var x = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
        x = 0
    }
    
    @IBAction func register(_ sender: Any) {
         if(x == 1){
        let parameters: Parameters=[
            
            "username":username.text!,
            "password":password.text!,
            "datedenaissane":datenn.date.description
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
        {
            response in
            
            print(response)
            
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! String
                
                
              
                
            }
            
        }
        let alert = UIAlertController(title: "Success", message: "Register done ", preferredStyle: .alert)
        
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
