//
//  SnakeViewController.swift
//  snakes_of_virginia
//
//  Created by John White on 11/17/15.
//  Copyright © 2015 John White. All rights reserved.


import UIKit

class SnakeViewController: UIViewController {
    
    
    lazy var slideShow: UIScrollView = {
        var slide = UIScrollView()
        slide.translatesAutoresizingMaskIntoConstraints = false
        slide.pagingEnabled = true
        
        return slide
    }()
    
    lazy var mapImage: UIImageView = {
        var map = UIImage(named: "northern_copperhead")
        var imv = UIImageView(image: map)
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.contentMode = .ScaleToFill
        return imv
    }()
    
    override func viewDidLoad() {
        
        self.edgesForExtendedLayout = UIRectEdge.Bottom.intersect(UIRectEdge.Top)
        
        var x: CGFloat = 0.0
        
        let width = UIScreen.mainScreen().bounds.width
        
        for _ in 1...5 {
            let imv =
              UIImageView(frame: CGRect(x: CGFloat(x), y: CGFloat(0.0), width: CGFloat(width), height: CGFloat(200.0)))
            imv.image = UIImage(named: "northern_copperhead")!
            imv.contentMode = .ScaleAspectFit
            slideShow.addSubview(imv)
            x = x + width
            
        }
        
        slideShow.contentSize = CGSize(width: x, height: 200.0)
        
        self.view.addSubview(slideShow)
        self.view.addSubview(mapImage)
        
        let dict = ["slide": slideShow, "mapImage": mapImage]
        
        let constraint1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|[slide(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let constraint2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|[slide]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.view.addConstraints(constraint1)
        self.view.addConstraints(constraint2)
        
        let constraint3 = NSLayoutConstraint.constraintsWithVisualFormat("V:|[slide]-[mapImage(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let constraint4 = NSLayoutConstraint.constraintsWithVisualFormat("H:|[mapImage]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.view.addConstraints(constraint3)
        self.view.addConstraints(constraint4)
        
        
        
        
    }
}










