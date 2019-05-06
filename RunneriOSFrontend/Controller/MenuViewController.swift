//
//  MenuViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/6/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

enum MenuType: Int{
    case home
    case profile
    case mytasks
    case logout
}

class MenuViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MenuViewController Loaded")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {
            print("returning in menutype")
            return
            
        }
        print("something selected")
        
        dismiss(animated: true){ [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
        
    }

}
