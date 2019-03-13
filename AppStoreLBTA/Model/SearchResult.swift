//
//  SearchResult.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 05/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
