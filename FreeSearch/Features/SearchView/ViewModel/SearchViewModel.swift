//
//  SearchViewModel.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    // MARK: - Properties.
    
    @Published var items: [Item] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    // MARK: - Search.
    
    func search(query: String){
        guard !query.isEmpty else{
            items.removeAll()
            return
        }
        isLoading = true
        let parameters = ["q": query]
        let router = ServiceRouter.getItems(parameters: parameters)
        
        NetworkManager.shared.request(router, type: SearchResponse.self) { [weak self] (result) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success(let response):
                    self.items = response.results
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidRequest:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
