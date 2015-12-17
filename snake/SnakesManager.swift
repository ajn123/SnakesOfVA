//
//  SnakesManager.swift
//  snake
//
//  Created by John White on 11/10/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit


class SnakesManager {
    
    static var instance = SnakesManager()
    
    let header = ["Venomous Snakes", "Small Snakes (up to 2 ft.) Harmless",
                  "Mid-sized Snakes (Between 2ft. and 4 ft.) Harmless",
                  "Large Snakes (Over 4 ft.) Harmless"]
                
    var snakes = [[Snake]]()
    
    init() {
        var venomousSnakes = [Snake]()
        var smallSnakes = [Snake]()
        var mediumSnakes = [Snake]()
        var largeSnakes = [Snake]()
       
        
        
// Venomous Species
        venomousSnakes.append(
          Snake(commonName: "Northern Copperhead", scientificName: "Agkistrodon contortrix mokasen", primaryImage: "copperhead16to9ratio"))
        
       
        venomousSnakes.append(
            Snake(commonName: "Eastern Cottonmouth", scientificName: "Agkistrodon piscivorus piscivorus", primaryImage: "eastern_cottonmouth.png"))
        
        venomousSnakes.append(
            Snake(commonName: "Timber Rattlesnake", scientificName: "Crotalus horridus", primaryImage: "timber_rattlesnake.png"))
        
       
        
// Small Snakes (Species with an average adult total length of up to 2 feet)
        
        smallSnakes.append(
            Snake(commonName: "Eastern Wormsnake", scientificName: "Carphophis amoenus amoenus", primaryImage: "eastern_wormsnake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Northern Scarletsnake", scientificName: "Cemophora coccinea copei", primaryImage: "northern_scarlet_snake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Northern Ring-necked Snake", scientificName: "Diadophis punctatus edwardsii", primaryImage: "northern_ring-necked_snake2.png"))
        
        smallSnakes.append(
            Snake(commonName: "Southern Ring-necked Snake", scientificName: "Diadophis punctatus edwardsii", primaryImage: "southern_ring-necked_snake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Rough Earthsnake", scientificName: "Haldea striatula", primaryImage: "rough_earthsnake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Scarlet Kingsnake", scientificName: "Lampropeltis elapsoides", primaryImage: "scarlet_kingsnake.png"))

        smallSnakes.append(
            Snake(commonName: "Smooth Greensnake", scientificName: "Opheodrys vernalis", primaryImage: "smooth_green_snake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Queensnake", scientificName: "Regina septemvittata", primaryImage: "queen_snake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Glossy Crayfish Snake", scientificName: "Regina rigida rigida", primaryImage: "glossy_crayfish_snake.png"))

        smallSnakes.append(
            Snake(commonName: "Northern Brownsnake", scientificName: "Storeria dekayi dekayi", primaryImage: "northern_brownsnake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Northern Red-bellied Snake", scientificName: "Storeria occipitomaculata occipitomaculata", primaryImage: "northern_red-bellied_snake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Southeastern Crowned Snake", scientificName: "Tantilla coronata", primaryImage: "southeastern_crowned_snake.png"))
        
        smallSnakes.append(
            Snake(commonName: "Mountain Earthsnake", scientificName: "Virginia valeriae pulchra", primaryImage: "mountain_earthsnake1.png"))
        
        smallSnakes.append(
            Snake(commonName: "Eastern Smooth Earthsnake", scientificName: "Virginia valeriae valeriae", primaryImage: "eastern_smooth_earthsnake.png"))
        
        
        
// Medium Snakes (Species with an average adult total length of between 2ft. and 4ft.)
        
        mediumSnakes.append(
            Snake(commonName: "Common Rainbow Snake", scientificName: "Farancia erytrogramma erytrogramma", primaryImage: "common_rainbow_snake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern hog-nosed Snake", scientificName: "Heterodon platirhinos", primaryImage: "eastern_hog-nosed_snake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Northern Rough Greensnake", scientificName: "Opheodrys aestivus", primaryImage: "rough_greensnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Mole Kingsnake", scientificName: "Lampropeltis calligaster rhombomaculata", primaryImage: "mole_kingsnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Kingsnake", scientificName: "Lampropeltis getula", primaryImage: "eastern_kingsnake3.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Black Kingsnake", scientificName: "Lampropeltis nigra", primaryImage: "eastern_black_kingsnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Milksnake", scientificName: "Lampropeltis triangulum triangulum", primaryImage: "eastern_milksnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Plain-bellied Water Snake", scientificName: "Nerodia erythrogaster", primaryImage: "plain_bellied_watersnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Northern Watersnake", scientificName: "Nerodia sipedon sipedon", primaryImage: "northern_watersnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Red Cornsnake", scientificName: "Pantherophis guttatus", primaryImage: "cornsnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Common Ribbonsnake", scientificName: "Thamnophis sauritus sauritus", primaryImage: "common_ribbonsnake.png"))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Gartersnake", scientificName: "Thamnophis sirtalis sirtalis", primaryImage: "eastern_gartersnake.png"))
        
// Large Snakes (Species with an average adult total length of over 4 ft.)
       
        
        largeSnakes.append(
            Snake(commonName: "Northern Black Racer", scientificName: "Coluber constrictor constrictor", primaryImage: "northern_black_racer.png"))
        

        largeSnakes.append(
            Snake(commonName: "Eastern Mudsnake", scientificName: "Farancia abacura abacura", primaryImage: "mud_snake.png"))
        
       
        largeSnakes.append(
            Snake(commonName: "Brown Watersnake", scientificName: "Nerodia taxispilota", primaryImage: "brown_watersnake.png"))
        

        largeSnakes.append(
            Snake(commonName: "Eastern Ratsnake", scientificName: "Pantherophis alleghaniensis", primaryImage: "eastern_ratsnake.png"))


        largeSnakes.append(
            Snake(commonName: "Northern Pinesnake", scientificName: "Pituophis melanoleucus melanoleucus", primaryImage: "northern_pine_snake.png"))
        

        
        // Add Snakes to the appropriate array
                   
        snakes.append(venomousSnakes)
        snakes.append(smallSnakes)
        snakes.append(mediumSnakes)
        snakes.append(largeSnakes)
        
    }
}



