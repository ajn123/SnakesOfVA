//
//  ViewController.swift
//  snake
//
//  Created by John White on 11/10/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit
import iOS_Slide_Menu

class ViewController: UITableViewController, SlideNavigationControllerDelegate {
  
  var filteredSnakes = [Snake]()
  
  var searchController: UISearchController! = nil 
  var allSnakes = SnakesManager.instance.snakes.flatMap() { $0.map { $0 } }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Snakes Of VA"
      
      // remove back button title
      self.navigationItem.hidesBackButton = true
      self.tableView.registerClass(SnakeCell.self, forCellReuseIdentifier: "snakeCell")
      
      // search controller 
      searchController = UISearchController(searchResultsController: nil)
      searchController.searchResultsUpdater = self
      searchController.dimsBackgroundDuringPresentation = false
      definesPresentationContext = true
      tableView.tableHeaderView = searchController.searchBar
    }
  
 
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
      return true
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      //print( SnakesManager.instance.header.count)
      if searchController.active && searchController.searchBar.text != "" {
        return 1
      }
      return SnakesManager.instance.header.count
    }
  
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(SnakesManager.instance.snakes[section].count)
      if searchController.active && searchController.searchBar.text != "" {
        return filteredSnakes.count
      }
      return SnakesManager.instance.snakes[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var snake: Snake! = nil
        // if the user is searching, return the filtered snake array
        if searchController.active && searchController.searchBar.text != "" {
          snake = filteredSnakes[indexPath.row]
        }
        else
        {
          snake = SnakesManager.instance.snakes[indexPath.section][indexPath.row]
        }
        let cell = SnakeCell(snake: snake)
        return cell
    }
    
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let vc = SnakeViewController()
    if searchController.active && searchController.searchBar.text != "" {
      vc.title = filteredSnakes[indexPath.row].commonName
      vc.snake = filteredSnakes[indexPath.row]
    }
    else{
      vc.title = SnakesManager.instance.snakes[indexPath.section][indexPath.row].commonName
      vc.snake = SnakesManager.instance.snakes[indexPath.section][indexPath.row]
    }
    self.navigationController?.pushViewController(vc, animated: true)
  }

  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return 250.0 // cell height of snakes
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if searchController.active || searchController.searchBar.text != "" {
      return nil
    }
    return SnakesManager.instance.header[section]
  }
  
  override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    var fontSize: CGFloat = 15.0
  
    // Account for different screen sizes.
    if(screenWidth <= 320)
    {
      fontSize = 11.0
    }
    else
    {
      fontSize = 15.0
    }
    
    let label = UILabel(frame: CGRect(x: 5, y: 5, width: screenWidth, height: fontSize + 5.0))
    label.font = UIFont.boldSystemFontOfSize(fontSize)
    label.text = SnakesManager.instance.header[section]
    
    let view = UIView()
    view.addSubview(label)
    
    if(section == 0) {
      view.backgroundColor = UIColor.init(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 0.2)
    }
    else {
      view.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 0.0, blue: 1.0, alpha: 0.2)
    }
    
    return view
  }
  
  
    // rescales the image to match aspect ratio before display
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
      let c = cell as! SnakeCell
      c.bImage = UIImage.scaleUIImageToSize(c.bImage, size: c.frame.size)
   }
  
}


/**
  This code takes care of all the searching for snakes based on the 
 users input.
*/
extension ViewController: UISearchResultsUpdating {
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
  
  func filterContentForSearchText(searchString: String, scope: String = "All") {
    filteredSnakes.removeAll()
    
    filteredSnakes = allSnakes.filter()
    {
      snake in
      return snake.commonName.lowercaseString.containsString(searchString.lowercaseString)
    }
    
    tableView.reloadData()
  }
}

