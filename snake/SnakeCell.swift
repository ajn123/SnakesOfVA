//
//  snakeCell.swift
//  Snakes of VA
//
//  Created by AJ Norton on 11/9/15.
//  Copyright © 2015 AJ Norton. All rights reserved.
//

import UIKit
import THLabel
import iOS_Slide_Menu


class SnakeCell: UITableViewCell {
    
    let CELL_HEIGHT = 200
  
    var label: THLabel = {
      var l = THLabel()
      l.translatesAutoresizingMaskIntoConstraints = false
      l.textColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      l.font = UIFont(name: "Arial", size: 20.0)
      l.strokeColor = UIColor.blackColor()
      l.strokeSize = 3.0
      return l
    }()
  
    var detailLabel: THLabel = {
        var detail = THLabel()
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.textColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        detail.font = UIFont(name: "Arial-ItalicMT", size: 16.0)
        detail.strokeColor = UIColor.blackColor()
        detail.strokeSize = 3.0
        return detail
    }()
    
    var bImage: UIImage!
    
    var snake: Snake!
    
    convenience init(snake: Snake) {
        self.init()
        self.snake = snake
        self.label.text = snake.commonName
        self.detailLabel.text = snake.scientificName
        
        // self.bImage =  snake.primaryImage!
        // self.bImage =  UIImage(named: "northern_copperhead")!
        // print(snake.commonName)
        self.bImage =  snake.primaryImage!
        
        setLayout()
    }
  
  convenience init(img: UIImage) {
    self.init()
    self.snake = nil
    self.label.text = ""
    self.detailLabel.text = ""
    
    // self.bImage =  snake.primaryImage!
    // self.bImage =  UIImage(named: "northern_copperhead")!
    // print(snake.commonName)
    self.bImage = img
    
    let imageView1 = UIImageView(image: bImage)
    imageView?.contentMode = .ScaleAspectFit
    imageView1.contentMode = .ScaleAspectFit
    
    imageView1.translatesAutoresizingMaskIntoConstraints = false
    
    let dict = ["image": imageView1, "label": label, "detailLabel": detailLabel]
    
    
    self.addSubview(imageView1)
    
    let c1 =
    NSLayoutConstraint.constraintsWithVisualFormat("V:|-[image]-|",
      options: NSLayoutFormatOptions(), metrics: nil, views: dict)
    
    print(self.bounds.width)
    
    
    var centerScreen = 20
    var rightAlignment: Int = Int(SlideNavigationController.sharedInstance().portraitSlideOffset)
      + centerScreen
    
    let c2 =
    NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(centerScreen)-[image]-\(rightAlignment)-|",
      options: NSLayoutFormatOptions(), metrics: nil, views: dict)
    
    self.addConstraints(c1)
    self.addConstraints(c2)

  }
  
 
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    
    
    func setLayout() {
        
        let imageView1 = UIImageView(image: bImage)
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.contentMode = UIViewContentMode.ScaleToFill
        
        let dict = ["image": imageView1, "label": label, "detailLabel": detailLabel]
        
        self.addSubview(imageView1)
        self.addSubview(label)
        self.addSubview(detailLabel)
        
        let c1 =
          NSLayoutConstraint.constraintsWithVisualFormat("V:|[image]|",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let c2 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|[image]|",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let cl1 =
          NSLayoutConstraint.constraintsWithVisualFormat("V:[label][detailLabel]-|",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let cl2 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|-2-[label]",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let cl3 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|-2-[detailLabel]",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.addConstraints(cl1)
        self.addConstraints(cl2)
        
        self.addConstraints(c1)
        self.addConstraints(c2)
        self.addConstraints(cl3)
        
    }
}
