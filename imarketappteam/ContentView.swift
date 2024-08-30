//
//  ContentView.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ProductListVM = .init()

    var body: some View {
            VStack {
                TabView {
                    ProductsView(viewModel: viewModel)
                        .tabItem {
                            Image(systemName: "carrot.fill")
                            Text("Products")
                        }
                    ItemsView (viewModel: viewModel )
                        .tabItem {
                            Image(systemName: "heart")
                            Text("My Items")
                        }
                    CartView (viewModel: viewModel)
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                }
            }
            .background {
                Color("BackgroundGray")
                    .ignoresSafeArea()
            }
            .preferredColorScheme(.dark)
        }
    }

    #Preview {
        ContentView()
    }
#Preview {
    ContentView()
}
