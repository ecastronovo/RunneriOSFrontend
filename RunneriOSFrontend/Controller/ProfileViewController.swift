//
//  ProfileViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/7/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    //    {
    //        "user": {
    //            "id": 6,
    //            "username": "Dimple",
    //            "first_name": "Dimple",
    //            "last_name": "Dimple",
    //            "email": "dimple@scu.edu",
    //            "password": "pbkdf2_sha256$120000$EMGz4iwrxDqT$3totm9Tg11tqCtplabu0h4BHZe0hTdp0Vi+PDrZiTuA="
    //        },
    //        "Phone": "0123456789",
    //        "ProfilePicture": "",
    //        "Addr1": "",
    //        "Addr2": "",
    //        "City": "",
    //        "State": "",
    //        "PostalCode": ""
    //        }
    
    var userIDOld: Int = 0
    
    var usernameOld: String = ""
    var first_nameOld: String  = ""
    var last_nameOld: String = ""
    var emailOld: String = ""
    var passwordOld: String = ""
    var PhoneOld: String = ""
    var ProfilePictureOld: String = ""
    var Addr1Old: String = ""
    var Addr2Old: String = ""
    var CityOld: String = ""
    var StateOld: String = ""
    var PostalCodeOld: String = ""
    
    
    

    @IBOutlet weak var textFieldUsername: UITextField!
    var toggleChange = false
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    @IBAction func editButton(_ sender: UIButton) {
        if !toggleChange {
            
            textFieldUsername.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            textFieldPhoneNumber.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            textFieldEmail.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            textPassword.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            textFieldUsername.isUserInteractionEnabled = true
            textFieldPhoneNumber.isUserInteractionEnabled = true
            textFieldPhoneNumber.isUserInteractionEnabled = true
            textPassword.isUserInteractionEnabled = true
            editButton.setTitle("Save", for: .normal)
            
        }
        //else make post request
        else {
            textFieldUsername.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textFieldPhoneNumber.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textFieldEmail.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textPassword.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textFieldUsername.isUserInteractionEnabled = false
            textFieldPhoneNumber.isUserInteractionEnabled = false
            textFieldEmail.isUserInteractionEnabled = false
            textPassword.isUserInteractionEnabled = true
            editButton.setTitle("Edit", for: .normal)
            
            updateProfile()
            
        }
        
        toggleChange = !toggleChange
        //editButton = "Save"
        
    }
    
    private func updateProfile(){
        
        let user: Parameters = [
            "id": userID,
            "first_name" : first_nameOld,
            "last_name" : last_nameOld,
            "email" : "\(textFieldEmail.text ?? emailOld)",
            "username" : "\(textFieldUsername.text ?? usernameOld)",
            "password": passwordOld
        ]
        
        let parameters: Parameters = [
            "user" : user,
            "Phone" : "\(textFieldPhoneNumber.text ?? PhoneOld)",
            "Addr1": Addr1Old,
            "Addr2": Addr2Old,
            "City": CityOld,
            "State": StateOld,
            "PostalCode": PostalCodeOld,
            "ProfilePicture": ProfilePictureOld
        ]
        
        
        Alamofire.request("http://127.0.0.1:8000/user/\(userID - 1)/", method: .put, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue))
                print(response)
                print(response.response!.statusCode)
                let responseCode = response.response!.statusCode
                print(responseCode)
                let result = response.result
                print(response.response!.statusCode)
                if response.response!.statusCode >= 200 && response.response!.statusCode < 300 {
                    print("User Information Successfully changed")
                }
                else {
                    print("Error User Information not changed")
                }
        }
        
        

        
    }
    
    private func loadProfile(){
        Alamofire.request("http://localhost:8000/user/\(userID - 1)").responseJSON { (response) in // issue with indexing users
            let result = response.result
            //print(result.value)
            if let dict = result.value as? Dictionary<String, AnyObject>{
                print(dict)
                
                if let phoneNumber = dict["Phone"] as? String{
                    self.PhoneOld = phoneNumber
                    self.textFieldPhoneNumber.text = phoneNumber
                }
                if let profilePicture = dict["ProfilePicture"] as? String{
                    self.ProfilePictureOld = profilePicture
                }
                if let addr1 = dict["Addr1"] as? String{
                    self.Addr1Old = addr1
                }
                if let addr2 = dict["Addr2"] as? String{
                    self.Addr2Old = addr2
                }
                if let city = dict["City"] as? String{
                    self.CityOld = city
                }
                if let state = dict["Phone"] as? String{
                    self.StateOld = state
                }
                if let postalCode = dict["Phone"] as? String{
                    self.PostalCodeOld = postalCode
                }
                
                if let userInfo = dict["user"] as? Dictionary<String, AnyObject>{
                    //print(userInfo)
                    if let username = userInfo["username"] as? String{
                        self.textFieldUsername.text = username
                    }
                    if let email = userInfo["email"] as? String{
                        self.textFieldEmail.text = email
                    }
                    if let firstName = userInfo["first_name"] as? String{
                        self.first_nameOld = firstName
                    }
                    if let lastName = userInfo["last_name"] as? String{
                        self.last_nameOld = lastName
                    }
                    if let password = userInfo["password"] as? String{
                        self.passwordOld = password
                    }
                    if let user = userInfo["user"] as? Int{
                        self.userIDOld = user
                    }
                }
            }
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProfile()

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
