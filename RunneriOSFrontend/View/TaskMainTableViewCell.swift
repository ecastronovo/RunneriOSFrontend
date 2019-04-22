//
//  TaskMainTableViewCell.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/18/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import Foundation
import UIKit


class TaskMainTableViewCell: UITableViewCell {
    
    // MARK: IB Outlets
    
    @IBOutlet weak var taskProfileImage: UIImageView!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskCost: UILabel!
    
    
    
    // MARK: Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // Inserts cell with weather data
//    func populateCell(data: Task){
//        self.forecastDay.text = "\(data.getDate)"
//        self.tempLow.text = "\(data.getLowTemp)"
//        self.tempHigh.text = "\(data.getHighTemp)"
//        self.forecastIcon.image = data.getIcon
//        self.forecastDescription.text = "\(data.getDescription)"
//    }
    func populateCell(data: Task){
        
        self.taskTitle.text = data.getTaskName
        self.taskDescription.text = data.getDescription
        self.taskCost.text = "$ \(data.getReward)"
        self.taskProfileImage.image = UIImage(named: "linkedinPhoto")
        

        
        
//        self.forecastDay.text = "\(data.getDate)"
//        self.tempLow.text = "\(data.getLowTemp)"
//        self.tempHigh.text = "\(data.getHighTemp)"
//        self.forecastIcon.image = data.getIcon
//        self.forecastDescription.text = "\(data.getDescription)"
    }
}
