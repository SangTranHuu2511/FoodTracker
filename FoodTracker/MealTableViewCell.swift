//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by admin on 8/23/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealRating: RatingControl!
    @IBOutlet weak var mealImageView: UIImageView!
    
    var meal: Meal? {
        didSet {
            if let meal = meal {
                meal.name = mealName.text!
                meal.rating = mealRating.rating
                meal.image = mealImageView.image
            }
        
        }
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
