//
//  SearchViewService.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import Foundation


final class SearchViewService: SearchViewServiceProtocol {
    
    // MARK: - Search.

    func search(query: String, completion: @escaping (Result<SearchResponse, FSError>) -> Void) {
        let parameters = ["q": query]
        let router = ServiceRouter.getItems(parameters: parameters)
        
        NetworkManager.shared.request(router, type: SearchResponse.self) { [weak self] (result) in
            DispatchQueue.main.async {
                guard let _ = self else { return }
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
