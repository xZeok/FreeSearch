//
//  DescriptionView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 60))
            Text ("Haz tu búsqueda")
                .font(.title.weight(.bold))
            Text( "Comienza escribiendo en la barra de navegación lo que deseas buscar.")
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame (maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.gray)
    }
}

struct DescriptionCellView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
