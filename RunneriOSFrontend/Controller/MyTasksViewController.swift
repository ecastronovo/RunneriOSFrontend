//
//  MyTasksViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/14/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class MyTasksViewController: UIViewController {
    
    let myTasks = [Task]()
    let myRunTasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//Extention of ViewController to help handle the TableView with TableView's required functions
extension MyTasksViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTaskCell") as! TaskMainTableViewCell
        //if matches ur id then do not show
        cell.populateCell(data: myTasks[indexPath.row] )
        return cell
    }
}
