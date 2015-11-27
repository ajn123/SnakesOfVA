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
        slide.delegate = self
        
        return slide
    }()
    
    lazy var mapImage: UIImageView = {
        var imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    
    lazy var pageControl: UIPageControl = {
        var pg = UIPageControl()
        pg.tintColor = UIColor.grayColor()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.numberOfPages = 5
        return pg
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor()
        
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
        self.view.addSubview(pageControl)
        
        let dict = ["slide": slideShow, "mapImage": mapImage, "pageControl": pageControl]
        
        let constraint1 =
          NSLayoutConstraint.constraintsWithVisualFormat("V:|[slide(200)]",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let constraint2 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|[slide]|",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        // self.view.addConstraints(constraint1)
        self.view.addConstraints(constraint2)
        
        let constraint3 =
          NSLayoutConstraint.constraintsWithVisualFormat("V:|[slide(200)]-30-[mapImage(200)]",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let constraint4 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|[mapImage]|",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.view.addConstraints(constraint3)
        self.view.addConstraints(constraint4)
        
        
        let c1 =
          NSLayoutConstraint(item: self.pageControl, attribute: .CenterX, relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        let c2 =
          NSLayoutConstraint(item: self.pageControl, attribute: .Top, relatedBy: .Equal,
            toItem: self.slideShow,attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        self.view.addConstraint(c1)
        self.view.addConstraint(c2)

//        
        self.mapImage.image = UIImage(named: "copperhead16to9ratio")!
        
        var currentView: UIView = self.mapImage
        
        for i in 1...3 {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            var detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            
            label.text = "Dteails here"
            
            detailLabel.text = "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            
            detailLabel.numberOfLines = 0
            self.view.addSubview(label)
            self.view.addSubview(detailLabel)
            
            
            
            let titleConstraint = NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal,
                toItem: currentView, attribute: .Bottom, multiplier: 1, constant: 10)
            
            let detailConstraint = NSLayoutConstraint(item: detailLabel, attribute: .Top, relatedBy: .Equal,
                toItem: label, attribute: .Bottom, multiplier: 1, constant: 10)
            
            let widthConstraint = NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
            
            let widthConstraint2 = NSLayoutConstraint(item: detailLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
            
            let widthConstraint = NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
            
            let widthConstraint2 = NSLayoutConstraint(item: detailLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
            
            self.view.addConstraint(titleConstraint)
            self.view.addConstraint(detailConstraint)
            
            self.view.addConstraint(widthConstraint)
            self.view.addConstraint(widthConstraint2)
            
            currentView = detailLabel
            
        }
        
        
//        self.view.setNeedsLayout()
//        self.view.layoutIfNeeded()
//        print(self.mapImage.frame.size)
//        print(self.mapImage.image!)
//        self.mapImage.image = UIImage.scaleUIImageToSize(self.mapImage.image!, size: self.mapImage.frame.size)
//        
//        
    }
    
    
    
}


extension SnakeViewController: UIScrollViewDelegate {
  
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}









