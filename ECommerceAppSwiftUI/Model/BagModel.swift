//
//  BagModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 29/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

struct BagModel: Identifiable {
    
    let id = UUID()
    let name: String
    let imageURL: String
    let price: Int
    let company: String
    let rating: Int
    let type: String
    let isFevorite: Bool
    let color: String
    let size: String
}

extension BagModel {
    
    static func all() -> [BagModel] {
        return [
            BagModel(name: "Cool Sports Jacket Cool Sports Jacket", imageURL: "item", price: 49, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "S"),
            BagModel(name: "Sports Jacket", imageURL: "item", price: 92, company: "Jacks Jonse", rating: 3, type: "sale", isFevorite: false, color: "Green", size: "M"),
            BagModel(name: "Sports Jacket", imageURL: "item2", price: 79, company: "Jacks Jonse", rating: 5, type: "new", isFevorite: false, color: "Red", size: "L")
        ]
    }
}
