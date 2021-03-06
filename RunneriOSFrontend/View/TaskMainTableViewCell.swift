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
    
    let urlKey = "https://res.cloudinary.com/danishs/image/upload/v1555910140/redapple_sokanm.png"
    
    
    
    
    // MARK: Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func populateCell(data: Task){
        
        self.taskTitle.text = data.getTaskName
        self.taskDescription.text = data.getDescription
        self.taskCost.text = "$ \(Int(data.getReward))"
        self.taskProfileImage.image = UIImage(named: "darkprofile")
        
        
        
        
//          TO USE CLOUDANRY UNCOMMENT THE CODE
//        let url = URL(string: urlKey)
//
//        if let url = URL(string: urlKey){
//
//            do {
//                let data = try Data(contentsOf: url)
//                self.taskProfileImage.image = UIImage(data: data)
//
//            }catch let err {
//                print(" Error : \(err.localizedDescription)")
//            }
//        }
    }
}
