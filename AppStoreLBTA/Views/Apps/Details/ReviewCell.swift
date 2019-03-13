//
//  ReviewCell.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 13/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    
    let bodyLabel = UILabel(text: "Review body\nReview body\nReview body\n", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                titleLabel, authorLabel
                ], customSpacing: 8),
            starsLabel,
            bodyLabel
            ], spacing: 12)
        
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal) //Sets a lower value to title compared to authors. Default resistance is 2.50.
        authorLabel.textAlignment = .right 
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
