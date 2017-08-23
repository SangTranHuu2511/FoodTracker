
//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by admin on 8/22/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    
//    let meal1 = Meal(name: "Piazza", image: imageMeal1, rating: 3)
//    let meal2 = Meal(name: "Nooddle", image: imageMeal2, rating: 3)
//    let meal3 = Meal(name: "Rice", image: imageMeal3, rating: 5)
    
    var listMeals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageMeal1 = UIImage(named: "meal1")
        let imageMeal2 = UIImage(named: "meal2")
        let imageMeal3 = UIImage(named: "meal3")
        
        let meal1 = Meal(name: "Pizza", image: imageMeal1, rating: 2)
        let meal2 = Meal(name: "Food", image: imageMeal2, rating: 2)
        let meal3 = Meal(name: "Rice", image: imageMeal3, rating: 2)
        listMeals += [meal1, meal2, meal3]

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listMeals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as? MealTableViewCell else {
            fatalError("Error")
            
        }
        
        let meal  = listMeals[indexPath.row]
        cell.mealImageView.image = meal.image
        cell.mealRating.rating = meal.rating
        cell.mealName.text = meal.name
        return cell
    }
    
    
    @IBAction func passMeal(segue: UIStoryboardSegue) {
        if let mealViewController = segue.source as? MealViewController {
            listMeals.append(mealViewController.meal!)
            
            let indexPath = IndexPath(row: listMeals.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }

    }

}
