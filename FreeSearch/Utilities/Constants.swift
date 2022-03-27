//
//  Constants.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import Foundation

struct Constants {
    
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "es_CL")
        return formatter
    }()
}
