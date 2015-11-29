//
//  SnakeViewController.swift
//  snakes_of_virginia
//
//  Created by John White on 11/17/15.
//  Copyright © 2015 John White. All rights reserved.


import UIKit

class SnakeViewController: UIViewController {
    
    var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
    
    lazy var slideShow: UIScrollView = {
        var slide = UIScrollView(frame: CGRect(x: 0, y: 0,
            width: UIScreen.mainScreen().bounds.width, height: 200))
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
        pg.pageIndicatorTintColor = UIColor.orangeColor()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.numberOfPages = 5
        return pg
    }()
    
    lazy var screenScrollView: UIScrollView = {
        var screen = UIScrollView(frame: UIScreen.mainScreen().bounds)
        return screen
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor()
        
        self.edgesForExtendedLayout = UIRectEdge.Bottom.intersect(UIRectEdge.Top)
        
        var x: CGFloat = 0.0

        for _ in 1...5 {
            let imv =
              UIImageView(frame: CGRect(x: CGFloat(x), y: CGFloat(0.0),
                width: CGFloat(screenWidth), height: CGFloat(200)))
            imv.image = UIImage(named: "northern_copperhead")!
            imv.contentMode = .ScaleAspectFit
            slideShow.addSubview(imv)
            x = x + screenWidth
        }
        
        self.view.addSubview(screenScrollView)
        slideShow.contentSize = CGSize(width: x, height: 200.0)
        
        self.screenScrollView.addSubview(slideShow)
        self.screenScrollView.addSubview(mapImage)
        self.screenScrollView.addSubview(pageControl)
        
        let dict = ["slide": slideShow, "mapImage": mapImage,
            "pageControl": pageControl, "screenScroll": screenScrollView]
   
        
        let constraint3 =
          NSLayoutConstraint.constraintsWithVisualFormat("V:|-230-[mapImage]",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let constraint4 =
          NSLayoutConstraint.constraintsWithVisualFormat("H:|[mapImage]",
            options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.screenScrollView.addConstraints(constraint3)
        self.screenScrollView.addConstraints(constraint4)
        
        
        
        
    
        let c1 =
          NSLayoutConstraint(item: self.pageControl, attribute: .CenterX, relatedBy: .Equal,
            toItem: self.screenScrollView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        let c2 =
          NSLayoutConstraint(item: self.pageControl, attribute: .Top, relatedBy: .Equal,
            toItem: self.slideShow,attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        self.screenScrollView.addConstraints([c1,c2])

        self.mapImage.image =
            UIImage.scaleUIImageToSize(UIImage(named: "copperhead16to9ratio")!,
            size: CGSize(width: screenWidth, height: 200.0))
        
        
        var currentView: UIView = self.mapImage
        var height: CGFloat = 450.0
        
        for _ in 1...3 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.font = UIFont(name: "ArialHebrew-Bold", size: 20.0)
            
            let detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            
            label.textColor = UIColor.whiteColor()
            
            label.text = "DETAILS HERE"
            detailLabel.textColor = UIColor.whiteColor()
            
            detailLabel.text = "lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            
            detailLabel.font = UIFont(name: "Avenir-Book", size: 16.0)
            
            detailLabel.numberOfLines = 0
            self.view.addSubview(label)
            self.view.addSubview(detailLabel)

            
            let titleConstraint = NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal,
                toItem: currentView, attribute: .Bottom, multiplier: 1, constant: 10)
            
            let detailConstraint = NSLayoutConstraint(item: detailLabel, attribute: .Top, relatedBy: .Equal,
                toItem: label, attribute: .Bottom, multiplier: 1, constant: 2)
            
            let widthConstraint = NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal,
                toItem: self.screenScrollView, attribute: .Width, multiplier: 1.0, constant: -5.0)
            
            let widthConstraint2 =
              NSLayoutConstraint(item: detailLabel, attribute: .Width, relatedBy: .Equal,
                toItem: self.screenScrollView, attribute: .Width, multiplier: 1.0, constant: -5.0)
            
            let rightConstraint =
              NSLayoutConstraint(item: detailLabel, attribute: .Left, relatedBy: .Equal,
                toItem: screenScrollView, attribute: .Left, multiplier: 1.0, constant: 5)
            
            let rightConstraint2 =
            NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal,
                toItem: screenScrollView, attribute: .Left, multiplier: 1.0, constant: 5)
            
            self.view.addConstraints([titleConstraint, detailConstraint])
            self.view.addConstraints([widthConstraint, widthConstraint2])
            self.view.addConstraints([rightConstraint, rightConstraint2])
           
            currentView = detailLabel
        }
        
        screenScrollView.contentSize =
            CGSize(width: screenWidth, height: 1500.0)
        
    }
    
    
    
}


extension SnakeViewController: UIScrollViewDelegate {
  
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}









