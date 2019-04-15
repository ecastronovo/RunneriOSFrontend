//
//  LoginViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/7/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

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
