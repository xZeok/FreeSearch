//
//  ItemDetailView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import SwiftUI

struct ItemDetailView: View {
    
    // MARK: - Properties.
    
    var item: Item
    
    // MARK: - Body.
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            ItemRemoteImage(urlString: item.thumbnail)
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(12)
            Text(item.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(3)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            HStack(spacing: 40) {
                Label(Constants.formatter.string(from: NSNumber(value: item.price)) ?? .empty, systemImage: ItemDetailViewConstants.priceImageName)
                    .font(.headline)
                    .foregroundColor(.green)
                Label("\(item.availableQuantity) \(ItemDetailViewConstants.available)", systemImage: ItemDetailViewConstants.amountImageName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Link(destination: item.permalink) {
                Text(ItemDetailViewConstants.buttonText)
                    .bold()
                    .font(.title3)
                    .frame(width: 280, height: 50)
                    .background(Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
        }
    }
}

// MARK: - Preview.

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item.mock())
    }
}
