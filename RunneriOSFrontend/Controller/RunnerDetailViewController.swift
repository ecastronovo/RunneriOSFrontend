//
//  RunnerDetailViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 6/6/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class RunnerDetailViewController: UIViewController {
    
    @IBOutlet weak var tastTitle: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskLocation: UILabel!
    @IBOutlet weak var taskCompleteDate: UILabel!
    @IBOutlet weak var taskCreator: UILabel!
    @IBOutlet weak var taskReward: UILabel!
    @IBAction func taskComplete(_ sender: Any) {
        completeATask()
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tastTitle.text = task_title
        taskDescription.text = task_description
        taskLocation.text = taskLocation.text! + task_location!
        taskCompleteDate.text = taskCompleteDate.text! + task_complete_date!
        taskReward.text! += String(task_reward!)
        taskCreator.text! += task_creator!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var currentTask: Task!
    
    var task_ID: Int!
    var task_title: String?
    var task_description: String?
    var task_location: String?
    var task_complete_date: String?
    var task_creator: String?
    var task_reward: Double?
    
    private func completeATask() -> Bool {
        
        let parameters: Parameters = [
            "TaskTitle": currentTask.getTaskName,
            "Description": currentTask.getDescription,
            "Reward": currentTask.getReward,
            "DateOfCompletion": "2019-04-18",
            "TimeOfCompletion": "00:00:00",
            "Addr1": currentTask.getAddr1,
            "City" : currentTask.getCity,
            "State" : currentTask.getState,
            "PostalCode" : currentTask.getPostalCode,
            "TaskType": "Moving",
            "TaskStatus": "Completed",
            "RunnerFK": "\(userID)",
            "AuthorFK": currentTask.getAuthorFK
        ]
        
        Alamofire.request("http://127.0.0.1:8000/task/\(Int(task_ID))/", method: .put, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response)
                print(response.response!.statusCode)
                //                responseCode = response.response!.statusCode
                //                print(responseCode)
                let result = response.result
                // TODO: On completion handler
                
                if response.response!.statusCode == 200{
                    let alertController = UIAlertController(title: "Task Approved", message:
                        "You are now running Task: \(self.task_title!)", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    // When we go back to main, change toggle to 1
                    //                    {
                    //                        self.navigationController?.popViewController(animated: true)
                    //                    }
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                else {
                    let alertController = UIAlertController(title: "Task Denied", message:
                        "You cannot run this task", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    //dismiss(animated: true)
                }
        }
        
        return true
    }
  

}
