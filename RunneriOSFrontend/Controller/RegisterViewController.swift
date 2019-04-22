//
//  RegisterViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/7/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    // Email regex: /^\S+@\S+\.\S+$/
    
    let emailRegex = "/^\\S+@\\S+\\.\\S+$/"
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    
    //MARK: Properties
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    
    var responseCode:Int  = 400
    
    @IBAction func sign_up(_ sender: UIButton) {
//        let matched = matches(for: emailRegex, in: email.text!)
//        print(matched)
        if validInputs() {
            if createUser(){
                let alertController = UIAlertController(title: "Success", message:
                    "You have created an account for: \(username.text!)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                // redirect to sign in
            }
        }
    }
    
    private func makeNewUser(){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: Functions
    
    private func validInputs() -> Bool {
        // TODO: valid input checks
        return true
    }
    
    private func createUser() -> Bool {
        postUserInfo(){ response in
            // Do your stuff here
            
            
        }
        print("need a completion handler")
        if responseCode >= 300 || responseCode < 200{
            print("false")
            return false
        }
        print(true)
        return true
    }
   
    
    
//    {
//    "first_name": "",
//    "last_name": "",
//    "email": "",
//    "username": "",
//    "password": "",

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func postUserInfo(completion: @escaping (String) -> Void) {
        let firstNameValue = fullname.text
        let lastNameValue = fullname.text
        let emailValue = email.text
        let usernameValue = username.text
        let passwordValue = password.text
        let confirmPasswordValue = confirm_password.text
        
        
        let user: Parameters = [
            "first_name" : firstNameValue!,
            "last_name" : lastNameValue!,
            "email" : emailValue!,
            "username" : usernameValue!,
            "password" : passwordValue!
        ]
        
        let parameters: Parameters = [
            "user" : user,
            "Phone" : "0123456789",
            "Addr1": "",
            "Addr2":"",
            "City": "",
            "State":"",
            "PostalCode":"",
            "ProfilePicture":""
        ]
        
        
        Alamofire.request("http://127.0.0.1:8000/register/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response)
                print(response.response!.statusCode)
                self.responseCode = response.response!.statusCode
                print(self.responseCode)
                let result = response.result
                
                if response.response!.statusCode >= 200 && response.response!.statusCode < 300 {
                    self.goToSignInAlert()
                }
                else {
                    // Registration Error Code
                }
        }
        
        
        
    }
    
    private func goToSignInAlert() {
        let alertController = UIAlertController(title: "Success", message:
            "You have created a new user", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
            self.goToSignIn()
        }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    private func goToSignIn() {
        print("Going to Sign In")
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destinationViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        present(destinationViewController, animated: true, completion: nil)
        
    }

}


