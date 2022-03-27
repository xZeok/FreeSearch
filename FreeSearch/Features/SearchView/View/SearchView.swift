//
//  SearchView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.items, id: \.id) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        ItemCell(item: item)
                    }
                }
                .navigationTitle("Búsqueda Libre")
            }
            .onAppear() { viewModel.search(query: "Nintendo Switch")}
            //if viewModel.isLoading { LoadingView() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
