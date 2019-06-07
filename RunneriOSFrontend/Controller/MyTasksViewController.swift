//
//  MyTasksViewController.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/14/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit
import Alamofire



class MyTasksViewController: UIViewController {
    let transition = SlideTransition()
    var toggleTaskList: Bool = false
    
    var myTasks = [Task]()
    var myCompletedTasks = [Task]()


    @IBOutlet weak var myTableView: UITableView!
    
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
    
    @IBAction func tap_toggle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            print("case zero")
            toggleTaskList = false
            self.myTableView.reloadData()
            myTableView.isUserInteractionEnabled = true
            
        case 1:
            print("case one")
            toggleTaskList = true
            self.myTableView.reloadData()
            myTableView.isUserInteractionEnabled = false
            
            
        default:
            break
        }
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
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    private func fetchTasks(){
        // Alamofire Request and Error handler
        Alamofire.request("http://localhost:8000/task/").responseJSON { (response) in
            let result = response.result
            if let list = result.value as? [Dictionary<String, AnyObject>]{
                print(list.count)
                for li in list {
                    if let runnerID = li["RunnerFK"] as? Int {
                        if runnerID == userID{
                            if let status = li["TaskStatus"] as? String{
                                if status == "Completed"{
                                    let mytask = Task(dict: li)
                                    self.myCompletedTasks.append(mytask)
                                }
                                else{
                                    let mytask = Task(dict: li)
                                    self.myTasks.append(mytask)
                                }
                            }

                        }
                        
                    }
                    //let task = Task(dict: li)
                    //self.tasksList.append(task)
                }
                
                self.myTableView.reloadData()
                print("my tasks:")
                print(self.myTasks)
                print("TableRefreshed")
                
            }
        }
    }

}



//Extention of ViewController to help handle the TableView with TableView's required functions
extension MyTasksViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if toggleTaskList == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: "rows") as! RunnerTableViewCell
            //cell.
            print("Trying to add cell")
            cell.title.text = myCompletedTasks[indexPath.row].getTaskName
            cell.status_icon.image = #imageLiteral(resourceName: "TaskComplete")
            cell.status_icon.backgroundColor = #colorLiteral(red: 1, green: 0.2739564038, blue: 0.8275659637, alpha: 1)
            
            print(cell)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "rows") as! RunnerTableViewCell
            
            //if matches ur id then do not show
            //cell.populateCell(data: myTasks[indexPath.row] )
            print("Trying to add cell2")
            cell.title.text = myTasks[indexPath.row].getTaskName
            cell.status_icon.image = #imageLiteral(resourceName: "inProgress")
            cell.status_icon.backgroundColor = #colorLiteral(red: 1, green: 0.2739564038, blue: 0.8275659637, alpha: 1)
            
            print(cell)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toggleTaskList == true{
            return myCompletedTasks.count
        }
        return myTasks.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RunnerDetailViewController") as? RunnerDetailViewController
        let index = indexPath.row
        vc?.task_ID = myTasks[index].getID
        vc?.task_title = myTasks[index].getTaskName
        vc?.task_description  = myTasks[index].getDescription
        vc?.task_location  = myTasks[index].getAddr1
        vc?.task_complete_date  = myTasks[index].getDateOfCompletion
        vc?.task_creator  = String(myTasks[index].getAuthorFK)
        vc?.task_reward  = myTasks[index].getReward
        vc?.currentTask = myTasks[index]
        //NavMainController
        // self.navigationController?.pushViewController(vc!, animated: true)
        present(vc!, animated: true, completion: nil)
    
        //let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
       // let index = indexPath.row
//        vc?.task_ID = tasksList[index].getID
//        vc?.task_title = tasksList[index].getTaskName
//        vc?.task_description  = tasksList[index].getDescription
//        vc?.task_location  = tasksList[index].getAddr1
//        vc?.task_complete_date  = tasksList[index].getDateOfCompletion
//        vc?.task_creator  = tasksList[index].getAuthorFK
//        vc?.task_reward  = tasksList[index].getReward
//        vc?.currentTask = tasksList[index]
        //NavMainController
        // self.navigationController?.pushViewController(vc!, animated: true)
       // present(vc!, animated: true, completion: nil)
    }
    
}

//
////Extention of ViewController to help handle the TableView with TableView's required functions
//extension MyTasksViewController:UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTaskCell") as! TaskMainTableViewCell
//        //if matches ur id then do not show
//        cell.populateCell(data: myTasks[indexPath.row] )
//        return cell
//    }
//}


extension MyTasksViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
