//
//  MenuViewController.swift
//  snakes_of_virginia
//
//  Created by AJ Norton on 12/9/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit
import iOS_Slide_Menu

class MenuViewController: UITableViewController {
  
  
  let menuItems = ["Snakes of Virginia", "About Snakes","Snake Identification",
    "Snake Conservation", "Snake Bite", "Living With Snakes", ""]
  
  let localizedStrings = ["", "Snakes_About", "Snake_Identification_Tips",
    "Snake_Conservation", "Snake_Bite", "Living_With_Snakes", ""]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Snakes Of VA"
    
    
  }
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // print(SnakesManager.instance.snakes[section].count)
    return menuItems.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //let cell = tableView.dequeueReusableCellWithIdentifier("snakeCell") as! SnakeCell
    var cell =  UITableViewCell()
    switch indexPath.row {
    case 0...5:
      
      cell.textLabel?.text = menuItems[indexPath.row]
    default:
      cell = SnakeCell(img: UIImage(named: "vhs_app_logo")!)
    }
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // do something here
    switch indexPath.row
    {
    case 0:
      if(SlideNavigationController.sharedInstance().topViewController is ViewController)
      {
        SlideNavigationController.sharedInstance().toggleLeftMenu()
      }
      else
      {
        SlideNavigationController.sharedInstance().popAllAndSwitchToViewController(
          ViewController(), withCompletion: nil)
      }
    case menuItems.count - 1:
      // Do nothing for clicking the logo
      break
    default:
        let str = localizedStrings[indexPath.row]
        let title = menuItems[indexPath.row]
        SlideNavigationController.sharedInstance().pushViewController(
          SnakeInformationViewController(str: str, title: title), animated: true)
      }
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if(indexPath.row < menuItems.count - 1)
    {
      print(indexPath.row)
      return UITableViewCell().bounds.height
    }
    
    return 200.0
  }

}
