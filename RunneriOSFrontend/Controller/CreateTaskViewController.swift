//
//  CreateTaskViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/13/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class CreateTaskViewController: UIViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var taskTypeField: UITextField!
    @IBOutlet weak var rewardField: UITextField!
    @IBOutlet weak var address2Field: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var postalCodeField: UITextField!
    
    @IBAction func createTask(_ sender: UIButton) {
        if !validInput(){
            let alertController = UIAlertController(title: "Missing Input", message:
                "One or more inputs were left blank", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        if createNewTask(){
            let alertController = UIAlertController(title: "Success", message:
                "You have created a new task", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                self.goToMain()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func validInput()->Bool{
        if taskNameField.text == "" {
            return false
        }
        if taskTypeField.text == "" {
            return false
        }
        if rewardField.text == "" {
            return false
        }
        
        return true
        
    }

    private func goToMain(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destinationViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MainpageViewController") as? MainpageViewController else {
            return
        }
        
        present(destinationViewController, animated: true, completion: nil)
    }
    
    
    private func createNewTask() -> Bool {
        
        let parameters: Parameters = [
            "TaskTitle": "\(taskNameField.text!)",
            "Description": "\(taskTypeField.text!)",
            "Reward": Double(rewardField.text!)!,
            "DateOfCompletion": "2019-04-18",
            "TimeOfCompletion": "00:00:00",
            "Addr1": "\(addressField.text!)",
            "City" : "\(cityField.text!)",
            "State" : "\(stateField.text!)",
            "PostalCode" : "\(postalCodeField.text!)",
            "TaskType": "Moving",
            "TaskStatus": "Available",
            "AuthorFK": "\(userID)"
        ]
        
        Alamofire.request("http://127.0.0.1:8000/task/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response)
                print(response.response!.statusCode)
//                responseCode = response.response!.statusCode
//                print(responseCode)
                let result = response.result
                // TODO: On completion handler
        }
        
        return true
        
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
