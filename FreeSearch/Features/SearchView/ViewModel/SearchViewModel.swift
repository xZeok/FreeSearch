//
//  SearchViewModel.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var isLoading = false
    //@Published var alertItem: AlertItem?
    
    func search(query: String){
        isLoading = true
        let parameters = ["q": query]
        let router = ServiceRouter.getItems(parameters: parameters)
        NetworkManager.shared.request(router, type: SearchResponse.self) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.items = response.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
