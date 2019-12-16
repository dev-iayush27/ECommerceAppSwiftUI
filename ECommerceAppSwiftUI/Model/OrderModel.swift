//
//  OrderModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 14/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

struct OrderModel: Identifiable {
    
    let id = UUID()
    let totalAmount: Int
    let orderNumber: String
    let quantity: Int
    let status: String
    let orderDate: String
    let trackingId: String
}

extension OrderModel {
    
    static func all() -> [OrderModel] {
        return [
            OrderModel(totalAmount: 199, orderNumber: "11230111", quantity: 2, status: "Processing", orderDate: "12 Nov, 2019", trackingId: "AG86526671"),
            OrderModel(totalAmount: 149, orderNumber: "11230123", quantity: 1, status: "Delivered", orderDate: "12 Oct, 2019", trackingId: "AG86526672"),
            OrderModel(totalAmount: 359, orderNumber: "11230187", quantity: 3, status: "Processing", orderDate: "12 Dec, 2019", trackingId: "AG86526673"),
            OrderModel(totalAmount: 99, orderNumber: "11230198", quantity: 1, status: "Delivered", orderDate: "12 Jan, 2019", trackingId: "AG86526674"),
            OrderModel(totalAmount: 199, orderNumber: "11230191", quantity: 2, status: "Processing", orderDate: "12 Oct, 2019", trackingId: "AG86526675"),
            OrderModel(totalAmount: 209, orderNumber: "11230461", quantity: 2, status: "Cancelled", orderDate: "12 Dec, 2019", trackingId: "AG86526676")
        ]
    }
}
