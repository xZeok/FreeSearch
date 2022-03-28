//
//  Item.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import Foundation

struct Item: Identifiable, Equatable, Codable {
    let id: String
    let title: String
    let price: Double
    let availableQuantity: Int
    let permalink: URL
    let thumbnail: String
}
