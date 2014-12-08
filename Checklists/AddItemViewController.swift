//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/8/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(controller: AddItemViewController)
  func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: AddItemViewControllerDelegate?

  @IBAction func done(sender: AnyObject) {
    let item = ChecklistItem()
    item.text = textField.text
    item.checked = false
    
    delegate?.addItemViewController(self, didFinishAddingItem: item)
  }
  
  @IBAction func cancel(sender: AnyObject) {
    delegate?.addItemViewControllerDidCancel(self)
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    let oldText: NSString = textField.text
    let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
    
    doneBarButton.enabled = (newText.length > 0)
    
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
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    textField.resignFirstResponder()
  }

}
