//
//  TEST_NetworkingViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/14/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit


import UIKit

class TEST_NetworkingViewController: UIViewController {
    

    
//    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func fetchRequest(_ sender: Any) {
        //USE 127.0.0.1/task too pull list of tasks from Django Webserver
        guard let urlToExecute = URL(string: "127.0.0.1/task") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
    
    @IBAction func executeSpecificRequest(_ sender: Any) {
        //USE 127.0.0.1/tasks too pull list of tasks from Django Webserver
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts" + "/" + textField.text!) else {
            return
        }
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
        
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
