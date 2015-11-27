//
//  snakeCell.swift
//  Snakes of VA
//
//  Created by AJ Norton on 11/9/15.
//  Copyright © 2015 AJ Norton. All rights reserved.
//

import UIKit

class SnakeCell: UITableViewCell {
    
    let CELL_HEIGHT = 200
    
    var label: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        l.font = UIFont(name: "Arial", size: 20.0)
        
        return l
    }()
    
    var detailLabel: UILabel = {
        var detail = UILabel()
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.textColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        detail.font = UIFont(name: "Arial-ItalicMT", size: 20.0)
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
        self.bImage =  UIImage(named: "copperhead16to9ratio")!
        
        setLayout()
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
          NSLayoutConstraint.constraintsWithVisualFormat("V:|[image]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let c2 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|[image]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let cl1 =
          NSLayoutConstraint.constraintsWithVisualFormat("V:[label][detailLabel]-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let cl2 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|-[label]", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        let cl3 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|-[detailLabel]", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.addConstraints(cl1)
        self.addConstraints(cl2)
        
        self.addConstraints(c1)
        self.addConstraints(c2)
        self.addConstraints(cl3)
        
        //print(bImage.size)
        
    }
}
