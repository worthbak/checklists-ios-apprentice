//
//  ChecklistItem.swift
//  Checklists
//
//  Created by M.I. Hollemans on 16/09/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
  var text = ""
  var checked = false
  var gifURL: NSURL = NSURL(string: "http://media.giphy.com/media/peAXYDqkm1TKE/giphy.gif")!

  func toggleChecked() {
    checked = !checked
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(text, forKey: "Text")
    aCoder.encodeBool(checked, forKey: "Checked")
    aCoder.encodeObject(gifURL, forKey: "gifURL")
  }
  
  required init(coder aDecoder: NSCoder) {
    text = aDecoder.decodeObjectForKey("Text") as String
    checked = aDecoder.decodeBoolForKey("Checked")
    gifURL = aDecoder.decodeObjectForKey("gifURL") as NSURL
    super.init()
  }
  
  override init() {
    super.init()
  }
  
}
