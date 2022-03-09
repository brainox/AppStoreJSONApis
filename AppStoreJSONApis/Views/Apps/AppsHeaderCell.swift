//
//  AppsHeaderCell.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    let companyLabel: UILabel = UILabel(text: "Facebook ", font: .boldSystemFont(ofSize: 12))
    
    let titleLabel: UILabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    
    let imageView: UIImageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .blue
        
        imageView.backgroundColor = .purple
        
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel,
            titleLabel,
            imageView
        ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
