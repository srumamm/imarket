//
//  ProductsView.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var viewModel: ProductListVM
    @State private var searchBar: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    if !searchBar.isEmpty {
                        HStack {
                            Text("\(filteredProducts.count) results for **\"\(searchBar)\"**")
                                .padding()
                            Spacer()
                        }
                    }
                    
                    ForEach(filteredProducts) { product in
                        ProductViewWidget(viewModel: viewModel, item: product)
                    }
                }
                .searchable(text: $searchBar, prompt: "What are you looking for?")
            }
            .background {
                Color("BackgroundGray")
                    .ignoresSafeArea()
            }
            .task {
                do {
                    try await viewModel.fetchProducts()
                } catch {
                    print("error")
                }
            }
        }
    }

#Preview {
    ProductsView(viewModel: ProductListVM())
        .preferredColorScheme(.dark)
}

