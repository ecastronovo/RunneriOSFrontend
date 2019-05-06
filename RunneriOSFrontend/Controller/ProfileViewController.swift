//
//  ProfileViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/7/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

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
            
        }
        
        toggleChange = !toggleChange
        //editButton = "Save"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
