//
//  MultipleAppCell.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 14/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class MultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            
            multipleAppsController.apps = todayItem.apps
            multipleAppsController.collectionView.reloadData()
        }
    }
    
    let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Utilizing your time", font: .boldSystemFont(ofSize: 32), numberOfLines: 2)
    
    let multipleAppsController = TodayMultipleAppsController(mode: .small)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        let stackView = VerticalStackView(arrangedSubviews: [
            categoryLabel,
            titleLabel,
            multipleAppsController.view
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
