//
//  AppsPageHeader.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 08/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
