//
//  SearchViewServiceProtocol.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import Foundation


protocol SearchViewServiceProtocol {
    func search(query: String, completion: @escaping (Result<SearchResponse, FSError>) -> Void)
}
