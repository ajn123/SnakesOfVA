//
//  SnakeViewController.swift
//  snakes_of_virginia
//
//  Created by John White on 11/17/15.
//  Copyright © 2015 John White. All rights reserved.


import UIKit

class SnakeViewController: UIViewController {
    
    let titleLabelVerticalDistance: CGFloat = 10
    let detailLabelVerticalDistance: CGFloat = 2
    
    let textTitles = ["Description", "Wherabouts"]
    
    var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
    
    let mapViewImageHeight: CGFloat = 200.0
    
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
        
        self.view.addSubview(screenScrollView)
        
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
        
        slideShow.contentSize = CGSize(width: x, height: 200.0)
        
        self.screenScrollView.addSubview(slideShow)
        self.screenScrollView.addSubview(mapImage)
        self.screenScrollView.addSubview(pageControl)
        
    
        let pageControlCenter =
          NSLayoutConstraint(item: self.pageControl, attribute: .CenterX, relatedBy: .Equal,
            toItem: self.screenScrollView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        let pageControlTop =
          NSLayoutConstraint(item: self.pageControl, attribute: .Top, relatedBy: .Equal,
            toItem: self.slideShow, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        self.screenScrollView.addConstraints([pageControlCenter,pageControlTop])
        
        let mapImageWidth =
          NSLayoutConstraint(item: self.mapImage, attribute: .Width, relatedBy: .Equal,
            toItem: screenScrollView, attribute: .Width, multiplier: 1.0, constant: -20)
        
        let mapImageTop =
        NSLayoutConstraint(item: self.mapImage, attribute: .Top, relatedBy: .Equal,
            toItem: pageControl, attribute: .Bottom, multiplier: 1.0, constant: titleLabelVerticalDistance)
        
        let mapImageCenterX =
        NSLayoutConstraint(item: self.mapImage, attribute: .CenterX, relatedBy: .Equal,
            toItem: screenScrollView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        let mapImageHeight =
        NSLayoutConstraint(item: self.mapImage, attribute: .Height, relatedBy: .Equal,
            toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: mapViewImageHeight)
        
        self.screenScrollView.addConstraints([mapImageWidth, mapImageTop,mapImageHeight, mapImageCenterX])
        
        self.mapImage.image =
            UIImage.scaleUIImageToSize(UIImage(named: "copperheadMap")!,
            size: CGSize(width: screenWidth, height: mapViewImageHeight))
        
        var currentView: UIView = self.mapImage
        
        for index in 0..<self.textTitles.count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.font = UIFont(name: "ArialHebrew-Bold", size: 20.0)
            
            let detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            
            label.textColor = UIColor.whiteColor()
            
            label.text = textTitles[index]
            detailLabel.textColor = UIColor.whiteColor()
            
            detailLabel.text = NSLocalizedString("cornSnakeDescription", comment: "description")
                
            detailLabel.font = UIFont(name: "Avenir-Book", size: 16.0)
            
            detailLabel.numberOfLines = 0
            self.screenScrollView.addSubview(label)
            self.screenScrollView.addSubview(detailLabel)

            
            let titleConstraint = NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal,
                toItem: currentView, attribute: .Bottom, multiplier: 1, constant: titleLabelVerticalDistance)
            
            let detailConstraint = NSLayoutConstraint(item: detailLabel, attribute: .Top, relatedBy: .Equal,
                toItem: label, attribute: .Bottom, multiplier: 1, constant: detailLabelVerticalDistance)
            
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
    }
    
    
    override func viewDidAppear(animated: Bool) {
        var height: CGFloat = 0.0
        for item in screenScrollView.subviews {
            height += item.bounds.height
        }
        height += CGFloat((self.navigationController?.navigationBar.bounds.height)! +
            UIApplication.sharedApplication().statusBarFrame.size.height)
        height += ((titleLabelVerticalDistance + detailLabelVerticalDistance) * CGFloat(self.textTitles.count)) +
            titleLabelVerticalDistance
        screenScrollView.contentSize = CGSize(width: screenWidth, height: height)
    }
    
}


extension SnakeViewController: UIScrollViewDelegate {
  
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}









