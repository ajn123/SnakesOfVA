//
//  ViewController.swift
//  snake
//
//  Created by John White on 11/10/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(SnakeCell.self, forCellReuseIdentifier: "snakeCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(SnakesManager.instance.snakes[section].count)
        return SnakesManager.instance.snakes[section].count
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("snakeCell") as! SnakeCell
        let snake = SnakesManager.instance.snakes[indexPath.section][indexPath.row]
        let cell = SnakeCell(snake: snake)
        print("\(indexPath.row)  \(snake.commonName)")
        //print(snake.commonName)
      //  cell.textLabel?.text = snake.commonName
        
      //  let imgView = UIImageView(image: snake.primaryImage)
      //  imgView.contentMode = UIViewContentMode.ScaleAspectFit
        //cell.backgroundView! = imgView
        //cell.im = UIImageView(image: snake.primaryImage)
        print("B Image is: \(cell.bImage.size)")
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = SnakeViewController()
        vc.title = SnakesManager.instance.snakes[indexPath.section][indexPath.row].commonName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250.0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SnakesManager.instance.header[section]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //print( SnakesManager.instance.header.count)
        return SnakesManager.instance.header.count
    }
    
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let c = cell as! SnakeCell
  //      print("B Image is: \(c.bImage.size)")
        c.bImage = UIImage.scaleUIImageToSize(c.bImage, size: c.frame.size)
  //      print("B2 Image is: \(c.bImage.size)")
    }
    
    // Set the section background color
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if(section == 0) {
            
            
            //view.tintColor = UIColor.redColor()

          
            view.tintColor = UIColor.init(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 0.2)
            
        }
            
        else {
            
            //view.tintColor = UIColor.blueColor()
            
            view.tintColor = UIColor.init(colorLiteralRed: 0.0, green: 0.0, blue: 1.0, alpha: 0.2)
            
        } 
        
    }
    
    
    
}

