//
//  ProductViewWidget.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/30/24.
//

import SwiftUI
struct ProductViewWidget: View {
    @ObservedObject var viewModel: ProductListVM
    var item: Product
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: item.thumbnail)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 128, height: 128)
                    } else if phase.error != nil {
                        Text("No image")
                    } else {
                        Image(systemName: "photo")
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .lineLimit(1)
                    Text(String(format: "$%.2f", item.price))
                        .font(.title3)
                        .bold()
                    Text(item.category.rawValue.capitalized)
                        .font(.footnote)
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color("CategoryGray"))
                        }
                    HStack {
                        Button {
                            if viewModel.cartItems.contains(where: {$0.id == item.id} ) {
                                if let index = viewModel.cartItems.firstIndex(where: {$0.id == item.id}) {
                                    viewModel.cartItems.remove(at: index)
                                }
                            } else {
                                viewModel.cartItems.append(item)
                            }

