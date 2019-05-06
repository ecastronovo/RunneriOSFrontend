//
//  DetailViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/5/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskLocation: UILabel!
    @IBOutlet weak var taskCompleteDate: UILabel!
    @IBOutlet weak var taskCreator: UILabel!
    @IBOutlet weak var taskReward: UILabel!
    @IBAction func taskRun(_ sender: UIButton) {
        runATask()
    }
    
    var currentTask: Task!
    
    
    
    
    
    var task_title: String?
    var task_description: String?
    var task_location: String?
    var task_complete_date: String?
    var task_creator: String?
    var task_reward: Double?
    
    private func runATask() -> Bool {
        
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
            "TaskStatus": "Running",
            "RunnerFK": "2",
            "AuthorFK": "7"
        ]
        
        //runner fk and Taskstatus to change
        
        
        Alamofire.request("http://127.0.0.1:8000/task/", method: .put, parameters: parameters, encoding: JSONEncoding.default)
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
        
        taskTitle.text = task_title
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
    

}
