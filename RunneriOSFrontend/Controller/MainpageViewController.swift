//
//  MainpageViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/18/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire

class MainpageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    
    var currentTask: Task!
    var tasksList = [Task]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
        fetchTasks()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchTasks(){
        // Alamofire Request and Error handler
        Alamofire.request("http://localhost:8000/task/").responseJSON { (response) in
            let result = response.result
            print(result.value)
            if let list = result.value as? [Dictionary<String, AnyObject>]{
                print(list.count)
                for li in list {
                    let task = Task(dict: li)
                    self.tasksList.append(task)
                    print("TaskAppended")
                }
                self.tableView.reloadData()
                print("TableRefreshed")
            }
        }
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
extension MainpageViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskMainCell") as! TaskMainTableViewCell
        
        cell.populateCell(data: tasksList[indexPath.row] )
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
}
