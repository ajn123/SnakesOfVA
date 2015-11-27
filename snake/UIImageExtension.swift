//
//  UIImageExtension.swift
//  snakes_of_virginia
//
//  Created by Mark Norton on 11/27/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func scaleUIImageToSize(let image: UIImage, let size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
}
