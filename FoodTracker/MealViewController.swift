//
//  ViewController.swift
//  FoodTracker
//
//  Created by admin on 8/21/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit

class MealViewController: UIViewController{
    
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var mealImageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameTextField.delegate = self
    }
}

extension MealViewController: UITextFieldDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealNameLabel.text = mealNameTextField.text
        textField.resignFirstResponder()
        
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


