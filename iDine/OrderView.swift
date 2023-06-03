//
//  OrderView.swift
//  iDine
//
//  Created by < Bible  /> on 31/05/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order;
    @State private var isPlacingOrder = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) {
                        item in HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItem)
                }
                Section {
                    NavigationLink("place order") {
                        CheckoutView()
                    }
                }.disabled(order.items.isEmpty)
            }.navigationTitle("Order")
                .toolbar {
                    EditButton()
                }
        }
    }
    func deleteItem(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
