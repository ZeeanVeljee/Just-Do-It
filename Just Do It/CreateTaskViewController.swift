//
//  CreateTaskViewController.swift
//  Just Do It
//
//  Created by Zeean Veljee on 26/03/17.
//  Copyright © 2017 Zed. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskPrioritySwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createTaskTapped(_ sender: Any) {
        //creat a task from the outlet info
        let task = Task()
        task.taskName = taskNameTextField.text!
        task.priority = taskPrioritySwitch.isOn
        
        //add the new task to the array in previous VC
        previousVC.tasks.append(task)
        previousVC.taskTableView.reloadData()
        navigationController!.popViewController(animated: true)
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
