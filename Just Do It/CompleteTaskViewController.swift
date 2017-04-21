//
//  CompleteTaskViewController.swift
//  Just Do It
//
//  Created by Zeean Veljee on 21/04/17.
//  Copyright © 2017 Zed. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var previousVC = TasksViewController()
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if  task.priority{
            taskLabel.text = "\(task.taskName)❗️"
        }
        else {
            taskLabel.text = "\(task.taskName)"
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completeTask(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
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
