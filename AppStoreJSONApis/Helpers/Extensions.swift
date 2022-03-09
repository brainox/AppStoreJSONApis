//
//  Extensions.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitleColor(.blue, for: .normal)
        self.setTitle(title, for: .normal)
    }
}