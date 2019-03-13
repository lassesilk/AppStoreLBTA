//
//  AppGroup.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 09/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
