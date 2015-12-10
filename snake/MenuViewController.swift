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
  
  
  let menuItems = ["Snakes of Virginia", "About Snakes", "Snake Conservation",
                   "Snake Bite", "FAQ", "About"]
  
  
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
    let cell =  UITableViewCell()
    cell.textLabel?.text = menuItems[indexPath.row]
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
    default:
        SlideNavigationController.sharedInstance().popAllAndSwitchToViewController(SnakeInformationViewController(), withCompletion: nil)
      }
  }
  

}
