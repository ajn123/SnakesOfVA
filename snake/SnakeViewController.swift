//
//  SnakeViewController.swift
//  snakes_of_virginia
//
//  Created by John White on 11/17/15.
//  Copyright © 2015 John White. All rights reserved.


import UIKit

class SnakeViewController: UIViewController {
  
    var snake: Snake! = nil
  
    let titleLabelVerticalDistance: CGFloat = 10
    let detailLabelVerticalDistance: CGFloat = 4
    
    let textTitles = ["Length", "Description", "Habitat", "Habits", "Notes"]
    
    let mapViewImageHeight: CGFloat = 260.0
    
    lazy var slideShow: UIScrollView = {
        var slide = UIScrollView(frame: CGRect(x: 0, y: 0,
            width: UIScreen.mainScreen().bounds.width, height: 260))
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
        pg.numberOfPages = 0
        return pg
    }()
    
    lazy var screenScrollView: UIScrollView = {
        var screen = UIScrollView(frame: UIScreen.mainScreen().bounds)
        
        return screen
    }()
  
  lazy var  descriptionLabel: UILabel = {
    var dl = UILabel()
    dl.translatesAutoresizingMaskIntoConstraints = false
    dl.font = UIFont(name: "Avenir-Book", size: 16.0)
    dl.textColor = UIColor.whiteColor()
    dl.numberOfLines = 0
    return dl
  }()
  
    override func viewDidLoad() {
      
        self.view.backgroundColor = UIColor.blackColor()
        
        self.edgesForExtendedLayout = UIRectEdge.Bottom.intersect(UIRectEdge.Top)
        
        self.view.addSubview(screenScrollView)
        
        var x: CGFloat = 0.0
        var num = 2 // start at the second image
      
        var snakeImage: UIImage? = snake.primaryImage
      
        while(snakeImage != nil) {
          let imv =
          UIImageView(frame: CGRect(x: CGFloat(x + 10), y: CGFloat(0.0),
            width: CGFloat(screenWidth - 20), height: CGFloat(mapViewImageHeight)))
          
          imv.image = snakeImage!
          
          imv.contentMode = .ScaleAspectFit
          slideShow.addSubview(imv)
          x = x + screenWidth
          pageControl.numberOfPages = num - 2
          snakeImage = UIImage(named: "\(snake.primaryImageName)\(num)")
          num += 1
          pageControl.numberOfPages += 1

        }
        
        slideShow.contentSize = CGSize(width: x, height: mapViewImageHeight)
        
        self.screenScrollView.addSubview(slideShow)
        self.screenScrollView.addSubview(mapImage)
        self.screenScrollView.addSubview(pageControl)
        self.screenScrollView.addSubview(descriptionLabel)
        descriptionLabel.text = "this is the sample text"
      
        // Constraints for Label
        let descriptionLabelConstraint =
        NSLayoutConstraint(item: descriptionLabel, attribute: .Top, relatedBy: .Equal,
          toItem: pageControl, attribute: .Bottom, multiplier: 1, constant: detailLabelVerticalDistance)
      
        let descriptionLabelConstraint2 =
        NSLayoutConstraint(item: descriptionLabel, attribute: .Width, relatedBy: .Equal,
          toItem: self.screenScrollView, attribute: .Width, multiplier: 1.0, constant: -5.0)
      
        let descriptionLabelConstraint3 =
        NSLayoutConstraint(item: descriptionLabel, attribute: .Left, relatedBy: .Equal,
          toItem: screenScrollView, attribute: .Left, multiplier: 1.0, constant: 5)
        
        let descriptionLabelConstraint4 =
        NSLayoutConstraint(item: descriptionLabel, attribute: .Right, relatedBy: .Equal,
          toItem: screenScrollView, attribute: .Right, multiplier: 1.0, constant: 5)
        // ****
        
      
      
    
        let pageControlCenter =
          NSLayoutConstraint(item: self.pageControl, attribute: .CenterX, relatedBy: .Equal,
            toItem: self.screenScrollView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        let pageControlTop =
          NSLayoutConstraint(item: self.pageControl, attribute: .Top, relatedBy: .Equal,
            toItem: self.slideShow, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        self.screenScrollView.addConstraints([pageControlCenter,pageControlTop])
        
        let mapImageWidth =
          NSLayoutConstraint(item: self.mapImage, attribute: .Width, relatedBy: .Equal,
            toItem: screenScrollView, attribute: .Width, multiplier: 1.0, constant: -40)
        
        let mapImageTop =
        NSLayoutConstraint(item: self.mapImage, attribute: .Top, relatedBy: .Equal,
            toItem: descriptionLabel, attribute: .Bottom, multiplier: 1.0, constant: detailLabelVerticalDistance)
        
        let mapImageCenterX =
        NSLayoutConstraint(item: self.mapImage, attribute: .CenterX, relatedBy: .Equal,
            toItem: screenScrollView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        let mapImageHeight =
        NSLayoutConstraint(item: self.mapImage, attribute: .Height, relatedBy: .Equal,
            toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 200)
        
        self.screenScrollView.addConstraints([mapImageWidth, mapImageTop,mapImageHeight, mapImageCenterX])
      
        self.screenScrollView.addConstraints(
          [descriptionLabelConstraint4, descriptionLabelConstraint3,descriptionLabelConstraint2,descriptionLabelConstraint])
      
        self.mapImage.contentMode = .ScaleAspectFit
    
        let snakeName = snake.commonName.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "_")
        let mapImg = UIImage(named: "\(snakeName)_map")
      
        self.mapImage.backgroundColor = UIColor.whiteColor()
        if let im = mapImg {
          self.mapImage.image = im
        }
        else {
          self.mapImage.image = UIImage(named: "copperhead_map_app")
        }
      
      
      
      
        var currentView: UIView = self.mapImage
        
        for (index, item) in self.textTitles.enumerate() {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.font = UIFont(name: "ArialHebrew-Bold", size: 20.0)
            
            let detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            
            label.textColor = UIColor.whiteColor()
            
            label.text = textTitles[index]
            detailLabel.textColor = UIColor.whiteColor()
            
            detailLabel.text = NSLocalizedString("\(self.snake.commonName)_\(item)", comment: "description")
                
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
          
            let leftConstraint =
              NSLayoutConstraint(item: detailLabel, attribute: .Right, relatedBy: .Equal,
                toItem: screenScrollView, attribute: .Right, multiplier: 1.0, constant: 5)
          
        
            let rightConstraint2 =
              NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal,
                toItem: screenScrollView, attribute: .Left, multiplier: 1.0, constant: 5)
          
          let leftConstraint2 =
            NSLayoutConstraint(item: label, attribute: .Right, relatedBy: .Equal,
              toItem: screenScrollView, attribute: .Right, multiplier: 1.0, constant: 5)
          
            self.view.addConstraints([titleConstraint, detailConstraint])
            self.view.addConstraints([widthConstraint, widthConstraint2])
            self.view.addConstraints([rightConstraint, rightConstraint2])
          
            self.view.addConstraints([rightConstraint, rightConstraint2])
            self.view.addConstraints([leftConstraint, leftConstraint2])
          
            currentView = detailLabel
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        var height: CGFloat = 0.0
        print(animated)
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









