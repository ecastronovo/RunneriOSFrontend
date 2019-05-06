//
//  DetailViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/5/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskLocation: UILabel!
    @IBOutlet weak var taskCompleteDate: UILabel!
    @IBOutlet weak var taskCreator: UILabel!
    @IBOutlet weak var taskReward: UILabel!
    @IBAction func taskRun(_ sender: UIButton) {
        
    }
    
    var task_title: String?
    var task_description: String?
    var task_location: String?
    var task_complete_date: String?
    var task_creator: String?
    var task_reward: Double?
    

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
