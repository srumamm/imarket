//
//  CartView.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: ProductListVM
    @State private var isPickupSelected = true
    @State private var totalAmount = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Menu {
                        Button {
                            isPickupSelected = true
                        } label: {
                            Text("Pick up")
                            if isPickupSelected {
                                Image(systemName: "checkmark")
                            }
                        }
                        Button {
                            isPickupSelected = false
                        } label: {
                            Text("Delivery")
                            if !isPickupSelected {
                                Image(systemName: "checkmark")
                            }
                        }
                    } label: {
                        Text(isPickupSelected ? "Pick up" : "Delivery")
                            .foregroundColor(.white)
                            .bold()
                            .font(.callout)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                            .bold()
                            .font(.callout)
                    }
                    
                    Text(isPickupSelected ? "from" : "to")
                        .foregroundColor(.gray)
                    Text("Cupertino")
                        .underline()
                        .bold()
                        .font(.callout)
                    Spacer()
                }
                .padding(.leading)
                
                ScrollView {
                    ForEach(viewModel.cart) { item in
                        CartViewWidget(item: item)
                    }
                    VStack {
                        HStack {
                            Text("Total: \(String(format: "$%.2f", totalAmount))")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        HStack {
                            Text("\(viewModel.cart.count) \(viewModel.cart.count == 1 ? "item" : "items")")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("CheckoutGray"))
                    )
                    .padding(.horizontal)
                }
                
                Button {
                    viewModel.cart.removeAll()
                    totalAmount = 0.0
                } label: {
                    Text("Check out")
                        .frame(maxWidth: 300, maxHeight: 10)
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().fill(Color.blue))
                        .padding(.bottom, 20)
                }
            }
            .background(Color("BackgroundGray").ignoresSafeArea())
            .navigationTitle("Cart")
        }
        .preferredColorScheme(.dark)
        .onAppear {
            totalAmount = viewModel.calcTotal()
        }
    }
}

#Preview {
    CartView(viewModel: ProductListVM())
}
