//
//  SearchView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.items, id: \.id) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        ItemCellView(item: item)
                    }
                }
                if viewModel.items.isEmpty { DescriptionView() }
                if viewModel.isLoading { LoadingView() }
            }
            .navigationTitle("Búsqueda Libre")
        }
        .searchable(text: $searchTerm)
        .onChange(of: searchTerm, perform: { newValue in
            viewModel.search(query: newValue)
        })
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
