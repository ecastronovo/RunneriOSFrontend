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
