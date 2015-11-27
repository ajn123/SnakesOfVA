//
//  Snake.swift
//  snake
//
//  Created by John White on 11/10/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit




class Snake {
    var commonName:String
    var scientificName:String
    
    var description: String!  = ""
    
    var primaryImage:UIImage?
    
//    var mapImage: UIImage?
//    var snakeSlideShow: [Snake]?
//    
    init(commonName: String, scientificName: String, primaryImage: String) {
        self.commonName = commonName
        self.scientificName = scientificName
        self.primaryImage = UIImage(named: primaryImage)
    }
    
   
    
}