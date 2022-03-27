//
//  Item.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: String
    let title: String
    let price: Double
    let availableQuantity: Int
    let currencyId: String
    let permalink: URL
    let thumbnail: String
}
