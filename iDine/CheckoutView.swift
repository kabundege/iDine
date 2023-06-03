//
//  CheckoutView.swift
//  iDine
//
//  Created by < Bible  /> on 03/06/2023.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "credit Card", "iDine Points"];
    let tipAmouts = [10,15,20,25,0]
    
    @State private var tipAmount = 15
    @State private var showingPaymentalert = false
    @State private var addLoyaltyDetails = false
    @State private var paymentType = "Cash"
    @State private var loyalty = ""
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay ?",selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID",text: $loyalty)
                }
            }
            
            Section("Add a  trip") {
                Picker("percentage", selection: $tipAmount){
                    ForEach(tipAmouts, id: \.self){
                        Text("\($0)%")
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)"){
                Button("Confirm Order"){
                    //place order
                    showingPaymentalert.toggle();
                }
            }
        }.navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentalert){
            
        } message: {
            Text("Your total was \(totalPrice) - thank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
