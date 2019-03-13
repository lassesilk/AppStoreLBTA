//
//  ScreenshotCell.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 12/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .purple
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
