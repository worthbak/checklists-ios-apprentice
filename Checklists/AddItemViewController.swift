//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/8/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
  
  @IBOutlet weak var textField: UITextField!

  @IBAction func done(sender: AnyObject) {
    println("Contents of the text field are: \(textField.text)")
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func cancel(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  override func viewDidLoad() {
    tableView.rowHeight = 44
  }

}
