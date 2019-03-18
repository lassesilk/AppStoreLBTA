//
//  MusicLoadingFooter.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 17/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class MusicLoadingFooter: UICollectionReusableView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .darkGray
        aiv.startAnimating()
        
        let label = UILabel(text: "Loading more..", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
        
        let stackView = VerticalStackView(arrangedSubviews: [
            aiv,
            label
            ], spacing: 8)
        
        addSubview(stackView)
        stackView.centerInSuperview(size: CGSize(width: 200, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
