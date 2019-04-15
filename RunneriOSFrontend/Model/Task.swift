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
    
    var name: String
    var photo: UIImage?
    var cost: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, cost: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || cost < 0  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.cost = cost
    }
    
    
}
