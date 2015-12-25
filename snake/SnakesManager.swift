//
//  SnakesManager.swift
//  snake
//
//  Created by John White on 11/10/15.
//  Copyright © 2015 John White. All rights reserved.
//

import UIKit


/**
This class manages all the snakes, each snake has a slide show of image names.  
 To add an image simply update that snakes image names array with the image name
 (as a string) of that image.
 
 



*/

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
          Snake(commonName: "Northern Copperhead", scientificName: "Agkistrodon contortrix mokasen",
            primaryImage: "northern_copperhead_image1.png", mapName: "northern_copperhead_map",
           imageNames: ["northern_copperhead_image1", "northern_copperhead_image2",
                       "northern_copperhead_image3", "northern_copperhead_image4",
                       "northern_copperhead_image5"]))
      
       
        venomousSnakes.append(
            Snake(commonName: "Eastern Cottonmouth", scientificName: "Agkistrodon piscivorus piscivorus", primaryImage: "eastern_cottonmouth_image1.png",
              mapName: "eastern_cottonmouth_map", imageNames: ["eastern_cottonmouth_image1"]))
        
        venomousSnakes.append(
            Snake(commonName: "Timber Rattlesnake", scientificName: "Crotalus horridus", primaryImage: "timber_rattlesnake_image1.png", mapName: "timber_rattlesnake_map",
          imageNames: ["timber_rattlesnake_image1"]))
        
       
        
// Small Snakes (Species with an average adult total length of up to 2 feet)
        
        smallSnakes.append(
            Snake(commonName: "Eastern Wormsnake", scientificName: "Carphophis amoenus amoenus", primaryImage: "eastern_wormsnake_image1.png", mapName: "eastern_wormsnake_map",
          imageNames: ["eastern_wormsnake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Northern Scarletsnake", scientificName: "Cemophora coccinea copei", primaryImage: "northern_scarlet_snake_image1.png", mapName: "northern_scarletsnake_map", imageNames: ["northern_scarlet_snake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Northern Ring-necked Snake", scientificName: "Diadophis punctatus edwardsii", primaryImage: "northern_ring-necked_snake_image1.png",
              mapName: "northern_ring-necked_snake_map", imageNames: ["northern_ring-necked_snake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Southern Ring-necked Snake", scientificName: "Diadophis punctatus edwardsii", primaryImage: "southern_ring-necked_snake_image1.png",
              mapName: "southern_ring-necked_snake_map", imageNames: ["southern_ring-necked_snake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Rough Earthsnake", scientificName: "Haldea striatula", primaryImage: "rough_earthsnake_image1", mapName: "rough_earthsnake_map",
          imageNames: ["rough_earthsnake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Scarlet Kingsnake", scientificName: "Lampropeltis elapsoides", primaryImage: "scarlet_kingsnake_image1", mapName: "scarlet_kingsnake_map",
          imageNames: ["scarlet_kingsnake_image1"]))

        smallSnakes.append(
            Snake(commonName: "Smooth Greensnake", scientificName: "Opheodrys vernalis", primaryImage: "smooth_green_snake_image1", mapName: "smooth_greensnake_map",
          imageNames: ["smooth_green_snake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Queensnake", scientificName: "Regina septemvittata",
              primaryImage: "queen_snake_image1", mapName: "queensnake_map",
          imageNames: ["queen_snake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Glossy Crayfish Snake", scientificName: "Regina rigida rigida", primaryImage: "glossy_crayfish_snake_image1", mapName: "glossy_crayfishsnake_map"
          , imageNames: ["glossy_crayfish_snake_image1"]))

        smallSnakes.append(
            Snake(commonName: "Northern Brownsnake", scientificName: "Storeria dekayi dekayi", primaryImage: "northern_brownsnake_image1", mapName: "northern_brownsnake_map",
          imageNames: ["northern_brownsnake_image1", "northern_brownsnake_image2"]))
        
        smallSnakes.append(
            Snake(commonName: "Northern Red-bellied Snake", scientificName: "Storeria occipitomaculata occipitomaculata",
              primaryImage: "northern_red-bellied_snake_image1",
              mapName: "northern_red-bellied_snake_map",
          imageNames: ["northern_red-bellied_snake_image1", "northern_red-bellied_snake_image2",
              "northern_red-bellied_snake_image3"]))
        
        smallSnakes.append(
            Snake(commonName: "Southeastern Crowned Snake", scientificName: "Tantilla coronata", primaryImage: "southeastern_crowned_snake_image1.png",
          mapName: "southeastern_crownedsnake_map", imageNames: ["southeastern_crowned_snake_image1"]))
        
        smallSnakes.append(
            Snake(commonName: "Mountain Earthsnake", scientificName: "Virginia valeriae pulchra", primaryImage: "mountain_earthsnake_image1",
          mapName: "mountain_earthsnake_map",
          imageNames: ["mountain_earthsnake_image1", "mountain_earthsnake_image2"]))
        
        smallSnakes.append(
            Snake(commonName: "Eastern Smooth Earthsnake", scientificName: "Virginia valeriae valeriae", primaryImage: "eastern_smooth_earthsnake_image1",
          mapName: "eastern_smooth_earthsnake_map",
          imageNames:  ["eastern_smooth_earthsnake_image1"]))
        
        
        
// Medium Snakes (Species with an average adult total length of between 2ft. and 4ft.)
        
        mediumSnakes.append(
            Snake(commonName: "Common Rainbow Snake", scientificName: "Farancia erytrogramma erytrogramma", primaryImage: "common_rainbow_snake_image1"
          , mapName: "common_ribbonsnake_map", imageNames:  ["common_rainbow_snake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern hog-nosed Snake", scientificName: "Heterodon platirhinos", primaryImage: "eastern_hog-nosed_snake_image1",
          mapName: "eastern_hog-nosed_snake_map", imageNames:
          ["eastern_hog-nosed_snake_image1", "eastern_hog-nosed_snake_image2",
              "eastern_hog-nosed_snake_image3"]))
        
        mediumSnakes.append(
            Snake(commonName: "Northern Rough Greensnake", scientificName: "Opheodrys aestivus", primaryImage: "rough_earthsnake_image1",
              mapName: "rough_greensnake_map", imageNames: ["rough_earthsnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Mole Kingsnake", scientificName: "Lampropeltis calligaster rhombomaculata", primaryImage: "mole_kingsnake_image1",
          mapName: "mole_kingsnake_map",
          imageNames: ["mole_kingsnake_image1", "mole_kingsnake_image2"]))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Kingsnake", scientificName: "Lampropeltis getula", primaryImage: "eastern_kingsnake_image1",
          mapName: "eastern_kingsnake_map",
          imageNames: ["eastern_kingsnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Black Kingsnake", scientificName: "Lampropeltis nigra", primaryImage: "eastern_black_kingsnake_image1",
          mapName: "eastern_black_kingsnake_map", imageNames:  ["eastern_black_kingsnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Milksnake", scientificName: "Lampropeltis triangulum triangulum", primaryImage: "eastern_milksnake_image1",
          mapName:  "eastern_milksnake_map", imageNames: ["eastern_milksnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Plain-bellied Water Snake", scientificName: "Nerodia erythrogaster", primaryImage: "plain_bellied_watersnake_image1",
          mapName: "plain-bellied_watersnake_map",
          imageNames: ["plain_bellied_watersnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Northern Watersnake", scientificName: "Nerodia sipedon sipedon", primaryImage: "northern_watersnake_image1",
          mapName: "northern_watersnake_map",
          imageNames: ["northern_watersnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Red Cornsnake", scientificName: "Pantherophis guttatus", primaryImage: "red_cornsnake_image_image1", mapName: "red_cornsnake_map",
          imageNames: ["red_cornsnake_image_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Common Ribbonsnake", scientificName: "Thamnophis sauritus sauritus", primaryImage: "common_ribbonsnake_image1",
          mapName: "common_ribbonsnake_map", imageNames: ["common_ribbonsnake_image1"]))
        
        mediumSnakes.append(
            Snake(commonName: "Eastern Gartersnake", scientificName: "Thamnophis sirtalis sirtalis", primaryImage: "eastern_gartersnake_image1",
          mapName: "eastern_gartersnake_map", imageNames: ["eastern_gartersnake_image1", "eastern_gartersnake_image2"]))
        
// Large Snakes (Species with an average adult total length of over 4 ft.)
       
        
        largeSnakes.append(
            Snake(commonName: "Northern Black Racer", scientificName: "Coluber constrictor constrictor", primaryImage: "northern_black_racer_image1",
          mapName: "northern_black_racer_map",
          imageNames: ["northern_black_racer_image1", "northern_black_racer_image2"]))
        

        largeSnakes.append(
            Snake(commonName: "Eastern Mudsnake", scientificName: "Farancia abacura abacura", primaryImage: "mud_snake_image1",
          mapName: "eastern_mudsnake_map", imageNames: ["mud_snake_image1"]))
        
       
        largeSnakes.append(
            Snake(commonName: "Brown Watersnake", scientificName: "Nerodia taxispilota", primaryImage: "brown_watersnake_image1",
          mapName: "brown_watersnake_map", imageNames: ["brown_watersnake_image1"]))
        

        largeSnakes.append(
            Snake(commonName: "Eastern Ratsnake", scientificName: "Pantherophis alleghaniensis", primaryImage: "eastern_ratsnake_image1",
          mapName: "eastern_ratsnake_map", imageNames: ["eastern_ratsnake_image1"]))


        largeSnakes.append(
            Snake(commonName: "Northern Pinesnake", scientificName: "Pituophis melanoleucus melanoleucus", primaryImage: "northern_pine_snake_image1",
          mapName: "northern_pinesnake_map", imageNames: ["northern_pine_snake_image1"]))
        

        
        // Add Snakes to the appropriate array
                   
        snakes.append(venomousSnakes)
        snakes.append(smallSnakes)
        snakes.append(mediumSnakes)
        snakes.append(largeSnakes)
        
    }
}



