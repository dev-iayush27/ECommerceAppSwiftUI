//
//  ClothModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 27/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

struct Cloth: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let price: Int
    let company: String
    let rating: Int
    let type: String
}

extension Cloth {
    
    static func all() -> [Cloth] {
        return [
            Cloth(name: "Cool Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "new"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "sale"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 5, type: "new"),
            Cloth(name: "Cool Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "sale"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "new"),
            Cloth(name: "Cool Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "new"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "sale"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 5, type: "new"),
            Cloth(name: "Cool Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "sale"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "new"),
            Cloth(name: "Sports Jacket", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "sale"),
        ]
    }
}
