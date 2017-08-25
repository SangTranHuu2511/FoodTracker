//
//  Meal.swift
//  FoodTracker
//
//  Created by admin on 8/22/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit


class Meal: NSObject, NSCoding {
    //property
    
    var name: String
    var image: UIImage?
    var rating: Int
    //config path
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("listMeals")
    
    //encode property to coresspond key
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    
    //decode encoded property's infomation
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            
            return nil
        }
        let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage
        
        let rating =  aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name, image: image, rating: rating)
        
        
    }
    init(name: String, image: UIImage?, rating: Int ) {
        self.name = name
        self.image = image
        self.rating = rating
    }
    
}

struct PropertyKey {
    static let name = "name"
    static let image =  "image"
    static let rating = "rating"
    
}

