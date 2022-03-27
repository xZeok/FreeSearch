//
//  ItemCellView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import SwiftUI

struct ItemCellView: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            ItemRemoteImage(urlString: item.thumbnail)
                .scaledToFill()
                .frame(width: 120, height: 90)
                .cornerRadius(8)
                .padding(.vertical, 4)
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                Text("$\(item.price, specifier: "%.0f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCellView(item: Item.mock())
    }
}

