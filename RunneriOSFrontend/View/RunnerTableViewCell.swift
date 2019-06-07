//
//  RunnerTableViewCell.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 6/6/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class RunnerTableViewCell: UITableViewCell {


    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status_icon: UIImageView!
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
//        self.taskCost.text = "$ \(Int(data.getReward))"
//        self.taskProfileImage.image = UIImage(named: "darkprofile")
        
        
        
        
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
