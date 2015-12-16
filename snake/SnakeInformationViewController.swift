//
//  SnakeInformationViewController.swift
//  snakes_of_virginia
//
//  Created by AJ Norton on 12/9/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit
import iOS_Slide_Menu

class SnakeInformationViewController: UIViewController, SlideNavigationControllerDelegate {
  
  lazy var label: UILabel = {
    var l = UILabel()
    l.font = UIFont(name: "Avenir-Book", size: 18.0)
    l.translatesAutoresizingMaskIntoConstraints = false
    l.textColor = UIColor.whiteColor()
    l.numberOfLines = 0
    return l
  }()
  
  lazy var screenScrollView: UIScrollView = {
    var screen = UIScrollView(frame: UIScreen.mainScreen().bounds)
    
    return screen
  }()
  
  init(str: String, title: String) {
    super.init(nibName: nil, bundle: nil)
    self.title = title
    label.text = NSLocalizedString(str, comment: "content")
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  

  override func viewDidLoad() {
    
    
    self.view.backgroundColor = UIColor.blackColor()
    self.edgesForExtendedLayout = UIRectEdge.Bottom.intersect(UIRectEdge.Top)
    
    self.view.addSubview(screenScrollView)
    
    self.screenScrollView.addSubview(label)
    
    self.navigationItem.leftBarButtonItem =
      UIBarButtonItem(title: "Menu", style: .Plain,
        target: SlideNavigationController.sharedInstance(),
        action: "toggleLeftMenu")
    
    
    let c1 = NSLayoutConstraint(item: label, attribute: .Top,
      relatedBy: .Equal, toItem: self.screenScrollView, attribute: .Top, multiplier: 1.0,
      constant: 5.0)
    
    let c2 = NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal,
      toItem: self.screenScrollView, attribute: .Width, multiplier: 1.0, constant: -5)
    
    let c3 = NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal,
      toItem: self.screenScrollView, attribute: .Left, multiplier: 1.0, constant: 10.0)
    
    self.screenScrollView.addConstraints([c1,c2,c3])
    
  }
  
  func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
    return true
  }
  
  override func viewDidAppear(animated: Bool) {
    screenScrollView.contentSize = CGSize(width: screenWidth, height: label.bounds.height + statusBarHeight + 5.0)
  }
  
}












