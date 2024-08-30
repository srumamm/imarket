//
//  ItemsView.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import SwiftUI

struct ItemsView: View {
    @ObservedObject var viewModel: ProductListVM
        
        var body: some View {
            NavigationStack {
                VStack {
                    if viewModel.likedItems.isEmpty {
                        Text ("Nothing here yet!")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            ForEach(viewModel.likedItems) { product in
                                ProductViewWidget(viewModel: viewModel, item: product)
                            }
                        }
                    }
                }
                .background {
                    Color("BackgroundGray")
                        .ignoresSafeArea()
                }
                .navigationTitle("My Items")
            }
            .preferredColorScheme(.dark)
        }
    }


#Preview {
        ItemsView(viewModel: ProductListVM())
    }
