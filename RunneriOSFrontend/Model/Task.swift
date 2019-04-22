//
//  Task.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/15/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class Task {
    
    // MARK: Properties

    private var taskName: String!
    private var description: String!
    private var reward: Double!
    private var dateOfCompletion: String!
    private var timeOfCompletion: String!
    private var addr1: String!
    private var addr2: String!
    private var city: String!
    private var state: String!
    private var postalCode: String!
    private var taskType: String!
    private var taskStatus: String!
    private var authorFK: String!
    private var runnerFK: String!
    private var createdTS: String!
    private var updatedTS: String!
    
    //private var taskName: String
    //    private var date: String!
    //    private var description: String!
    //    private var icon: UIImage!
    //    private var highTemp: Double!
    //    private var lowTemp: Double!
    
    
    
    //MARK: Initialization
    
    
//    {
//        "id": 15,
//        "TaskTitle": "moving",
//        "Description": "move my house",
//        "Reward": 5,
//        "DateOfCompletion": "2019-04-18",
//        "TimeOfCompletion": "00:00:00",
//        "Addr1": "500 el camino real",
//        "Addr2": "",
//        "City": "Santa Clara",
//        "State": "California",
//        "PostalCode": "95050",
//        "TaskType": "Moving",
//        "TaskStatus": "Available",
//        "AuthorFK": 7,
//        "RunnerFK": null,
//        "CreatedTS": "2019-04-19T01:58:31.371033Z",
//        "UpdatedTS": "2019-04-19T01:58:31.371055Z"
//    },
    
    init(dict: Dictionary<String, AnyObject>) {
        print("Task Initializer Called")
        if let taskName = dict["TaskTitle"] as? String {
            self.taskName = taskName
        }
        if let description = dict["Description"] as? String {
            self.description = description
        }
        if let reward = dict["Reward"] as? Double {
            self.reward = reward
        }
        if let dateOfCompletion = dict["DateOfCompletion"] as? String {
            self.dateOfCompletion = dateOfCompletion
        }
        if let timeOfCompletion = dict["TimeOfCompletion"] as? String {
            self.timeOfCompletion = timeOfCompletion
        }
        if let addr1 = dict["Addr1"] as? String {
            self.addr1 = addr1
        }
        if let addr2 = dict["Addr2"] as? String {
            self.addr2 = addr2
        }
        if let city = dict["City"] as? String {
            self.city = city
        }
        if let state = dict["State"] as? String {
            self.state = state
        }
        if let postalCode = dict["PostalCode"] as? String {
            self.postalCode = postalCode
        }
        if let taskType = dict["TaskType"] as? String {
            self.taskType = taskType
        }
        if let taskStatus = dict["TaskStatus"] as? String {
            self.taskStatus = taskStatus
        }
        if let authorFK = dict["AuthorFK"] as? String {
            self.authorFK = authorFK
        }
        if let runnerFK = dict["RunnerFK"] as? String {
            self.runnerFK = runnerFK
        }
        if let createdTS = dict["CreatedTS"] as? String {
            self.createdTS = createdTS
        }
        if let updatedTS = dict["UpdatedTS"] as? String {
            self.updatedTS = updatedTS
        }
        
    }
    
    var getTaskName: String {
        if taskName == nil {
            taskName = ""
        }
        return taskName
    }
    var getDescription: String {
        if description == nil {
            description = ""
        }
        return description
    }
    var getReward: Double {
        if reward == nil {
            reward = 0.0
        }
        return reward
    }
    var getDateOfCompletion: String {
        if dateOfCompletion == nil {
            dateOfCompletion = ""
        }
        return dateOfCompletion
    }
    var getTimeOfCompletion: String {
        if timeOfCompletion == nil {
            timeOfCompletion = ""
        }
        return timeOfCompletion
    }
    var getAddr1: String {
        if addr1 == nil {
            addr1 = ""
        }
        return addr1
    }
    var getAddr2: String {
        if addr2 == nil {
            addr2 = ""
        }
        return addr2
    }
    var getCity: String {
        if city == nil {
            city = ""
        }
        return city
    }
    var getState: String {
        if state == nil {
            state = ""
        }
        return state
    }
    var getPostalCode: String {
        if postalCode == nil {
            postalCode = ""
        }
        return postalCode
    }
    var getTaskType: String {
        if taskType == nil {
            taskType = ""
        }
        return taskType
    }
    var getTaskStatus: String {
        if taskStatus == nil {
            taskStatus = ""
        }
        return taskStatus
    }
    var getAuthorFK: String {
        if authorFK == nil {
            authorFK = ""
        }
        return authorFK
    }
    var getRunnerFK: String {
        if runnerFK == nil {
            runnerFK = ""
        }
        return runnerFK
    }
    var getCreatedTS: String {
        if createdTS == nil {
            createdTS = ""
        }
        return createdTS
    }
    var getUpdatedTS: String {
        if updatedTS == nil {
            updatedTS = ""
        }
        return updatedTS
    }
    
}


