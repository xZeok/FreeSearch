//
//  ItemDetailView.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import SwiftUI

struct ItemDetailView: View {
    var item: Item
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            ItemRemoteImage(urlString: item.thumbnail)
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(12)
            Text(item.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            HStack(spacing: 40) {
                Label("\(item.price)", systemImage: "dollarsign.circle.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Label("\(item.availableQuantity) disponibles", systemImage: "bag.circle.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Link(destination: item.permalink) {
                Text("Comprar")
                    .bold()
                    .font(.title2)
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

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MockData.sampleItem)
    }
}
