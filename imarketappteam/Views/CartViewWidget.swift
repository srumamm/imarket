//
//  CartRowView.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import SwiftUI

struct CartViewWidget: View {
    var item: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.thumbnail)) { imagePhase in
                switch imagePhase {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                case .failure(_):
                    Image(systemName: "exclamationmark.triangle")
                default:
                    Image(systemName: "photo")
                }
            }
            Text(item.title)
                .frame(maxWidth: 200, alignment: .leading)
            Spacer()
            Text(String(format: "$%.2f", item.price))
                .bold()
                .font(.title3)
        }
        .padding(.leading)
        .padding(.trailing, 10)
        .padding(.bottom,10)
        .background {
            Color("BackgroundGray")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CartViewWidget(item: Product.example)
}
