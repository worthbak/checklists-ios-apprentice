//
//  GifViewController.swift
//  Checklists
//
//  Created by Worth Baker on 12/8/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

protocol GifViewControllerDelegate: class {
  func gifViewControllerDidReturn(controller: GifViewController, withURL url: NSURL)
}

class GifViewController: UIViewController {
  
  var gifURL: NSURL?
  weak var delegate: GifViewControllerDelegate?
  
  @IBOutlet weak var imageViewGIF: FLAnimatedImageView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidAppear(animated: Bool) {
    var image = FLAnimatedImage(animatedGIFData: NSData(contentsOfURL: gifURL!))
    imageViewGIF.animatedImage = image
    
    activityIndicator.stopAnimating()
    activityIndicator.hidden = true
  }
  
  override func viewWillDisappear(animated: Bool) {
    if textField.text != gifURL?.absoluteString {
      println("the url changed - gifVC")
      let newGifURL = NSURL(string: textField.text)
      delegate?.gifViewControllerDidReturn(self, withURL: newGifURL!)
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      title = "Party Screen!"
      textField.text = gifURL?.absoluteString
      activityIndicator.startAnimating()
      
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
