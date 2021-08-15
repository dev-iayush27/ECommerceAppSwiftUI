//
//  MyOrdersView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 12/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct MyOrdersView: View {
    
    let arrOrder = OrderModel.all()
    @State private var selectorIndex = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            }
            .padding(.leading, 10)
            .frame(width: 40, height: 40)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Orders")
                .font(.headline)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBarView()
                Picker("", selection: $selectorIndex) {
                    Text("Delivered").tag(0)
                    Text("Processing").tag(1)
                    Text("Cancelled").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .vertical], 10)
                
                if selectorIndex == 0 {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            ForEach(self.arrOrder.filter { $0.status == "Delivered" }, id: \.id) { order in
                                OrderRow(order: order, selectorIndex: self.selectorIndex)
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                } else if selectorIndex == 1 {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            ForEach(self.arrOrder.filter { $0.status == "Processing" }, id: \.id) { order in
                                OrderRow(order: order, selectorIndex: self.selectorIndex)
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            ForEach(self.arrOrder.filter { $0.status == "Cancelled" }, id: \.id) { order in
                                OrderRow(order: order, selectorIndex: self.selectorIndex)
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct OrderRow: View {
    
    var order: OrderModel
    var selectorIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Order No: \(order.orderNumber)")
                Spacer()
                Text(order.orderDate)
                    .foregroundColor(.gray)
            }.padding([.top], 2)
            
            HStack() {
                Text("Tracking No:")
                    .foregroundColor(.gray)
                Text(order.trackingId)
            }.padding([.top], 2)
            
            HStack {
                Text("Quantity:")
                Text("\(order.quantity)")
                    .foregroundColor(.gray)
                Spacer()
                Text("Total Amount:")
                Text("$\(order.totalAmount)")
                    .foregroundColor(.gray)
            }.padding([.top], 2)
            
            if self.selectorIndex == 0 {
                Text(order.status)
                    .foregroundColor(.green)
                    .padding(.vertical, 1)
            } else if self.selectorIndex == 1 {
                Text(order.status)
                    .foregroundColor(Color.init(hex: "CCAA00"))
                    .padding(.vertical, 1)
            } else {
                Text(order.status)
                    .foregroundColor(.red)
                    .padding(.vertical, 1)
            }
            LineView()
        }.font(.footnote)
    }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
        //        MyOrdersView()
        //            .environment(\.colorScheme, .dark)
    }
}
