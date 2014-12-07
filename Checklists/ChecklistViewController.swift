//
//  ViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/7/14.
//  Copyright (c) 2014 Worth Baker. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableView.rowHeight = 44 // gets rid of annoying debug warning
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table View Methods
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
    
    let label = cell.viewWithTag(1000) as UILabel
    
    if indexPath.row % 5 == 0 {
      label.text = "Walk the dog"
    } else if indexPath.row % 5 == 1 {
      label.text = "Brush my teeth"
    } else if indexPath.row % 5 == 2 {
      label.text = "Learn iOS development"
    } else if indexPath.row % 5 == 3 {
      label.text = "Soccer practice"
    } else if indexPath.row % 5 == 4 {
      label.text = "Eat ice cream"
    }
    
    return cell
  }

}

