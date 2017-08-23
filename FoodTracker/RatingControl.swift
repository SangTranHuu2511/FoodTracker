import UIKit
@IBDesignable class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize: CGSize =  CGSize(width: 44.0, height: 40.0) {
        didSet {
            createButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            createButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createButton()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        createButton()
    }
    
    func ratingButtonTapped(button: UIButton) {
    
        let index = ratingButtons.index(of: button)!
        let selectRating = index + 1
        if selectRating == rating {
            rating = 0
        } else {
            
            rating = selectRating
        }
        
    }

    
    private func createButton() {
        //clear button
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount {
            //create button
            let button = UIButton()
            button.setImage(emptyStar, for: UIControlState.normal)
            button.setImage(filledStar, for: UIControlState.selected)
            button.setImage(highlightedStar, for: UIControlState.highlighted)
            button.setImage(highlightedStar, for: [UIControlState.highlighted, UIControlState.selected])
           
            
            //constrain button
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            //add button to stack
            
            addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            ratingButtons.append(button)
        }
        
    }
    
}
