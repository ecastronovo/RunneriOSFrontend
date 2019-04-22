//
//  LoginViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/7/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func sign_in(_ sender: Any) {
        if !anyInputErrors(){
        let alertController = UIAlertController(title: "Sign-in", message:
            "Username: \(username.text!)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        }
        
        let parameters: Parameters =  [
//            "username": "Dimple",
//            "password": "dimple"
            "username": "\(username.text!)",
            "password": "\(password.text!)"
        ]
        //https://stackoverflow.com/questions/35472917/alamofire-header-parameters
        // store auth token
        
        // MARK: Pull Main Page 
//        Alamofire.request("http://localhost:8000/task/").responseJSON { (response) in
//            let result = response.result
//            print(response)
//            print(result)
//        }
        Alamofire.request("http://localhost:8000/api-token-auth/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response)
                 //print(response.response!.statusCode)
//                responseCode = response.response!.statusCode
//                print(responseCode)
                let result = response.result
                let responseCode = (response.response!.statusCode)
                if responseCode == 200 {
                    print("Going to Main")
                    self.goToMain()
                }
                else {
                    print("Not Going to Main")
                    self.badLogin()
                }
            
        }
    }
    
    private func goToMain(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destinationViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MainpageViewController") as? MainpageViewController else {
            return
        }
        present(destinationViewController, animated: true, completion: nil)
        
    }
    private func badLogin(){
        
        let alertController = UIAlertController(title: "Sign-in", message:
            "Invalid Username or Password", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    func anyInputErrors() -> Bool {
        let str = username.text
        if str!.isEmpty {
            let alertController = UIAlertController(title: "Error", message:
                "Invalid Username: \(username.text!)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 15
        login.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
