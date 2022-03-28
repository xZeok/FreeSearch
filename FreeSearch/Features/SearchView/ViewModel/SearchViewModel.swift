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
    private let searchService: SearchViewServiceProtocol
    
    // MARK: - Initializer.
    
    init(searchService: SearchViewServiceProtocol = SearchViewService()) {
        self.searchService = searchService
    }
    
    
    // MARK: - Search.
    
    func search(query: String){
        guard !query.isEmpty else{
            items.removeAll()
            return
        }
        isLoading = true
        searchService.search(query: query) { [weak self] (result) in
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
                    self.alertItem = AlertContext.invalidRequest
                case .invalidResponse:
                    self.alertItem = AlertContext.invalidResponse
                case .unableToComplete:
                    self.alertItem = AlertContext.unableToComplete
                }
            }
        }
    }
}
