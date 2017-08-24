//
//  ViewController.swift
//  FoodTracker
//
//  Created by admin on 8/21/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit

class MealViewController: UIViewController{
    
    
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var mealImageview: UIImageView!
    @IBOutlet weak var rating: RatingControl!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let meal = meal {
            mealImageview.image = meal.image
            mealNameTextField.text = meal.name
            rating.rating = meal.rating
        }
        statusSave()
        mealNameTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.meal = Meal(name: mealNameTextField.text!, image: mealImageview.image, rating: rating.rating)
        
    }
    
    func statusSave() {
        let status = mealNameTextField.text ?? ""
        navigationItem.rightBarButtonItem?.isEnabled = !status.isEmpty
        
        
    }
    @IBAction func canncel (_sender: UIButton) {
        if presentingViewController is UINavigationController {
            dismiss(animated: true, completion: nil)
        } else if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
            
        }
    }
}

extension MealViewController: UITextFieldDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        navigationItem.title = mealNameTextField.text
        statusSave()
        
        return true
        
    }
    
    @IBAction func selectImageFromLibrary(_sender: UIGestureRecognizer) {
        let viewPickerController = UIImagePickerController()
        viewPickerController.sourceType = .photoLibrary
        present(viewPickerController, animated: true, completion: nil)
        viewPickerController.delegate = self
    
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            mealImageview.image = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}


