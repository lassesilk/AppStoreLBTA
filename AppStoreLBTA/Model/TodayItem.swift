//
//  TodayItem.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 14/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    let cellType: CellType
    
    let apps: [FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
}
