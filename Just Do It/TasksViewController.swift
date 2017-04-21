//
//  TasksViewController.swift
//  Just Do It
//
//  Created by Zeean Veljee on 26/03/17.
//  Copyright © 2017 Zed. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var taskTableView: UITableView!
    var tasks: [Task] = []
    var selectedIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTask()
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell implementation
        if tasks[indexPath.row].priority {
            cell.textLabel?.text = "\(tasks[indexPath.row].taskName)❗️"
        }
        else {
            cell.textLabel?.text = tasks[indexPath.row].taskName
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        selectedIndex = indexPath.row
    }
    
    func makeTask() -> [Task] {
        
        let task1 = Task()
        task1.taskName = "Mow the lawn"
        task1.priority = false
        
        let task2 = Task()
        task2.taskName = "Complete homework"
        task2.priority = true
        
        let task3 = Task()
        task3.taskName = "Update resume"
        task3.priority = false
        
        return [task1, task2, task3]
    }

    @IBAction func tapNewTask(_ sender: Any) {
        performSegue(withIdentifier: "createTask", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "createTask" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        
        else if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }

}

