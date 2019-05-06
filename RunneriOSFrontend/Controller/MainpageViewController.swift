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

    @IBOutlet weak var tableView: UITableView!
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
//            guard let next = storyboard?.instantiateViewController(withIdentifier: "next") else {return}
//            present(next, animated: true)
            print("mytasks")
        case .logout:
//            guard let next = storyboard?.instantiateViewController(withIdentifier: "next") else {return}
//            present(next, animated: true)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        let index = indexPath.row
        vc?.task_title = tasksList[index].getTaskName
        vc?.task_description  = tasksList[index].getDescription
        vc?.task_location  = tasksList[index].getAddr1
        vc?.task_complete_date  = tasksList[index].getDateOfCompletion
        vc?.task_creator  = tasksList[index].getAuthorFK
        vc?.task_reward  = tasksList[index].getReward
        vc?.currentTask = tasksList[index]
        //NavMainController
         self.navigationController?.pushViewController(vc!, animated: true)
         //present(vc!, animated: true, completion: nil)
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
