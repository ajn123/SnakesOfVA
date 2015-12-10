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
    var l = UILabel(frame: CGRect(x: 0, y: 0,
      width: UIScreen.mainScreen().bounds.width, height: 50))
    l.font = UIFont(name: "Avenir-Book", size: 16.0)
    l.text = "YOLOEU oUE OEU OUE OEU OEU OEU OEU UOEuoe oeu aoe uaoeu aoe uao eu aoeu aoe ua oeu aoe u aoe uao e aoeu aoe aoe uoa eu aoeu oaeua uaoe uoaeuaoeu oeu oae oae ua  eao uo aua eoauoaeu aoue oue oe oeauoeu ueoa euoa uoea "
    l.textColor = UIColor.whiteColor()
    l.numberOfLines = 0
    return l
  }()
  
  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.blackColor()
    
    self.view.addSubview(label)
    
    self.navigationItem.leftBarButtonItem =
      UIBarButtonItem(title: "Menu", style: .Plain,
        target: SlideNavigationController.sharedInstance(),
        action: "toggleLeftMenu")
  }
  
  func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
    return true
  }
  
}












