//
//  SearchResponse.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import Foundation

struct SearchResponse: Codable {
    let siteId: String
    let query: String
    let results: [Item]
}
