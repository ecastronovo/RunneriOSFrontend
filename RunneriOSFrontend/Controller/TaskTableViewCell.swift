//
//  TaskTableViewCell.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/11/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: Properties
    //@IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UITextView!
    @IBOutlet weak var cellCost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
