//
//  DescriptionView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import SwiftUI

struct DescriptionView: View {
    
    // MARK: - Body.
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: SearchViewConstants.DescriptionView.imageName)
                .font(.system(size: 60))
            Text (SearchViewConstants.DescriptionView.descriptionTitle)
                .font(.title.weight(.bold))
            Text(SearchViewConstants.DescriptionView.description)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame (maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.gray)
    }
}

// MARK: - Preview.

struct DescriptionCellView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
