//
//  ChecklistItem.swift
//  Checklists
//
//  Created by M.I. Hollemans on 16/09/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation

class ChecklistItem {
  var text = ""
  var checked = false

  func toggleChecked() {
    checked = !checked
  }
}
