//
//  HorizontalSnappingController.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 11/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    
    init() {
        let layout = BetterSnappingLayout()
            layout.scrollDirection = .horizontal
            super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout {
    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
//        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
//
//        let itemWidth = collectionView.frame.width - 48
//        let itemSpace = itemWidth + minimumInteritemSpacing
//        var pageNumber = round(collectionView.contentOffset.x / itemSpace)
//
//        // Skip to the next cell, if there is residual scrolling velocity left.
//        // This helps to prevent glitches
//        let vX = velocity.x
//        if vX > 0 {
//            pageNumber += 1
//        } else if vX < 0 {
//            pageNumber -= 1
//        }
//
//        let nearestPageOffset = pageNumber * itemSpace
//        return CGPoint(x: nearestPageOffset,
//                       y: parent.y)
//    }
}
