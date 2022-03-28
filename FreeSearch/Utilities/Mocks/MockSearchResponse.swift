//
//  MockSearchResponse.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import Foundation


extension SearchResponse {
    
    static func mock() -> SearchResponse {
        return SearchResponse(siteId: "MLC",
                              query: "test",
                              results: Item.mockItems())
    }
}
