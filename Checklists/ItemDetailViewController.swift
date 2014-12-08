//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/8/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
  func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
  func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
  func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
  
  var itemToEdit: ChecklistItem?
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: ItemDetailViewControllerDelegate?

  @IBAction func showNew(sender: AnyObject) {
    let mvc = MyViewController(nibName: "MyViewController", bundle: nil)
    mvc.gifURL = itemToEdit?.gifURL
    navigationController?.pushViewController(mvc, animated: true)
  }
  
  @IBAction func done(sender: AnyObject) {
    if let item = itemToEdit {
      item.text = textField.text
      delegate?.itemDetailViewController(self, didFinishEditingItem: item)
    } else {
      let item = ChecklistItem()
      item.text = textField.text
      item.checked = false
      delegate?.itemDetailViewController(self, didFinishAddingItem: item)
    }
  }
  
  @IBAction func cancel(sender: AnyObject) {
    delegate?.itemDetailViewControllerDidCancel(self)
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
    super.viewDidLoad()
    tableView.rowHeight = 44
    
    // If the view controller is passed a ChecklistItem to edit, change the title
    if let item = itemToEdit {
      title = "Edit Item"
      textField.text = item.text
      doneBarButton.enabled = true
    }
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
