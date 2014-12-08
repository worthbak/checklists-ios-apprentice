//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/8/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!

  @IBAction func done(sender: AnyObject) {
    println("Contents of the text field are: \(textField.text)")
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func cancel(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    let oldText: NSString = textField.text
    let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
    
    if newText.length > 0 {
    doneBarButton.enabled = true
    } else {
      doneBarButton.enabled = false
    }
    
    return true
  }
  
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  override func viewDidLoad() {
    tableView.rowHeight = 44
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  }

}
