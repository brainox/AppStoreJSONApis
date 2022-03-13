//
//  ScreenshotCell.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 13/03/2022.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    let previewImageView = UIImageView(cornerRadius: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        previewImageView.backgroundColor = .purple
        addSubview(previewImageView)
        previewImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
