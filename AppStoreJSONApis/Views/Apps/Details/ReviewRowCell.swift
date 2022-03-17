//
//  ReviewRowCell.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 13/03/2022.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsAndRatingLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 20))
    
    let reviewsController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .white
        
        addSubview(reviewsAndRatingLabel)
        addSubview(reviewsController.view)
        
        reviewsAndRatingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        
        reviewsController.view.anchor(top: reviewsAndRatingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
//        reviewsController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
