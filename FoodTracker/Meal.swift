//
//  Meal.swift
//  FoodTracker
//
//  Created by admin on 8/22/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit


class Meal {
    var name: String
    var image: UIImage?
    var rating: Int
    
    init(name: String, image: UIImage? ,rating: Int) {
        self.name = name
        self.image = image
        self.rating = rating
    }

}
