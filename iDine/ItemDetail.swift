//
//  ItemDetail.swift
//  iDine
//
//  Created by < Bible  /> on 31/05/2023.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem;
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding()
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                    
            }
            Text(item.description).padding()
            
            Button("Order This") {
                order.add(item: item)
            }.buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
