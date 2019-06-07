//
//  MyTaskTableViewCell.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/14/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import Foundation
import UIKit

class RunCell: UITableViewCell {

    // MARK: IB Outlets
    
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
        
//        self.taskTitle.text = data.getTaskName
//        self.taskDescription.text = data.getDescription
//        self.taskCost.text = "$ \(data.getReward)"
//        self.taskProfileImage.image = UIImage(named: "linkedinPhoto")
//
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
