//
//  Reviews.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 13/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
