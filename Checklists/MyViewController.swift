//
//  MyViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/8/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
  
  var gifURL: NSURL?
  
  @IBOutlet weak var imageViewGIF: FLAnimatedImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      title = "Party Screen!"
      
      var image = FLAnimatedImage(animatedGIFData: NSData(contentsOfURL: gifURL!))
      imageViewGIF.animatedImage = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
