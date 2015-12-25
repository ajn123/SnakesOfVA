//
//  UIViewControllerExtension.swift
//  snakes_of_virginia
//
//  Created by AJ Norton on 12/16/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit

extension UIViewController {
  
  var screenWidth: CGFloat {
    return UIScreen.mainScreen().bounds.width
  }
  
  var screenHeight: CGFloat {
    return UIScreen.mainScreen().bounds.height
  }
  
  var statusBarHeight: CGFloat {
    return UIApplication.sharedApplication().statusBarFrame.size.height +
      (navigationController?.navigationBar.bounds.height)!
  }
}
