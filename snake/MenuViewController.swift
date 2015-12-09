//
//  MenuViewController.swift
//  snakes_of_virginia
//
//  Created by AJ Norton on 12/9/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Snakes Of VA"
   
    
  }
  

  func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
    return true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // print(SnakesManager.instance.snakes[section].count)
    return 4
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //let cell = tableView.dequeueReusableCellWithIdentifier("snakeCell") as! SnakeCell
    let cell =  UITableViewCell()
    cell.textLabel?.text = "Snake"
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // do something here
    print(indexPath.row)
  }
  

}
