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
    let transition = SlideTransition()
    var toggleTaskList: Bool = false

    @IBOutlet weak var tableView: UITableView!
  
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            print("case zero")
            toggleTaskList = false
            self.tableView.reloadData()
            
        case 1:
            print("case one")
            toggleTaskList = true
            self.tableView.reloadData()
            
            
        default:
            break
        }
        
    }
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else {return}
            menuViewController.didTapMenuType = {menuType in
            print(menuType)
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType){
//        home
//        profile
//        mytasks
//        logout
        
        switch menuType {
        case .profile:
            guard let next = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") else {return}
            present(next, animated: true)
            print("profile")
        case .home:
            guard let next = storyboard?.instantiateViewController(withIdentifier: "MainpageViewController") else {return}
            present(next, animated: true)
            print("home")
        case .mytasks:
            guard let next = storyboard?.instantiateViewController(withIdentifier: "MyTasksViewController") else {return}
            present(next, animated: true)
            print("mytasks")
        case .logout:
            guard let next = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {return}
            present(next, animated: true)
            print("logout")

        default:
            print("default")
            break
        }
    }
    
    // MARK: Variables
    
    var currentTask: Task!
    var tasksList = [Task]()
    var myTasksList = [Task]()
    //var myTasksRunning = [Task]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
        fetchTasks()
        
//        let table: UITableViewController = UITableViewController()
//        let tableView: UITableView = UITableView()
//        tableView.frame = CGRect(x: 10, y: 10, width: 100, height: 500)
//        tableView.dataSource = table
//        tableView.delegate = table
//
//        self.view.addSubview(tableView)

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
                    if let ownerID = li["AuthorFK"] as? Int {
                        if ownerID == userID{
                            let mytask = Task(dict: li)
                            self.myTasksList.append(mytask)
                        }
                    }
                    if let status = li["TaskStatus"] as? String{
                        if status == "Running"{
                            continue
                        }
                        if status == "Completed"{
                            continue
                        }
                        else {
                            let task = Task(dict: li)
                            self.tasksList.append(task)
                        }
                    }
                }
                
                self.tableView.reloadData()
                print("TableRefreshed")
                print(userID)
                print(authToken)
                print(self.myTasksList)
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
        
        if toggleTaskList == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskMainCell") as! TaskMainTableViewCell
            
            cell.populateCell(data: myTasksList[indexPath.row] )
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskMainCell") as! TaskMainTableViewCell
            //if matches ur id then do not show
            
            
            
            cell.populateCell(data: tasksList[indexPath.row] )
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toggleTaskList == true{
            return myTasksList.count
        }
        return tasksList.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        let index = indexPath.row
        vc?.task_ID = tasksList[index].getID
        vc?.task_title = tasksList[index].getTaskName
        vc?.task_description  = tasksList[index].getDescription
        vc?.task_location  = tasksList[index].getAddr1
        vc?.task_complete_date  = tasksList[index].getDateOfCompletion
        vc?.task_creator  = String(tasksList[index].getAuthorFK)
        vc?.task_reward  = tasksList[index].getReward
        vc?.currentTask = tasksList[index]
        //NavMainController
        // self.navigationController?.pushViewController(vc!, animated: true)
        present(vc!, animated: true, completion: nil)
    }
    
}

extension MainpageViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
