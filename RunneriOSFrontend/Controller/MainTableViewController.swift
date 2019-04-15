//
//  MainTableViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/15/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    //MARK: Properties
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleTasks()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TaskTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }

         // Configure the cell...
        let task = tasks[indexPath.row]
        
        cell.cellTitle.text = task.name
        //cell.cellImage.image = task.photo
        cell.cellCost.text = String(task.cost)

        return cell
    }
 

    
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleTasks() {
        let photo1 = UIImage(named: "linkedinPhoto")
        guard let task1 = Task(name: "Get me food", photo: photo1, cost: 4) else {
            fatalError("Unable to instantiate task")
        }
        guard let task2 = Task(name: "Get me food", photo: photo1, cost: 4) else {
            fatalError("Unable to instantiate task")
        }
        guard let task3 = Task(name: "Get me food", photo: photo1, cost: 4) else {
            fatalError("Unable to instantiate task")
        }
        tasks += [task1 , task2 , task3]
        
    }

}
