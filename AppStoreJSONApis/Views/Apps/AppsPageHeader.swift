//
//  AppsPageHeader.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appsHeaderViewController = AppsHeaderViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(appsHeaderViewController.view)
        appsHeaderViewController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
