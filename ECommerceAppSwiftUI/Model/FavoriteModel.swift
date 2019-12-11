//
//  FavoriteModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 02/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

struct FavoriteModel: Identifiable {
    
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

extension FavoriteModel {
    
    static func all() -> [FavoriteModel] {
        return [
            FavoriteModel(name: "Cool Sports Jacket Cool Sports Jacket", imageURL: "item", price: 59, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "S"),
            FavoriteModel(name: "Sports Jacket", imageURL: "item", price: 49, company: "Jacks Jonse", rating: 3, type: "sale", isFevorite: false, color: "Green", size: "M"),
            FavoriteModel(name: "Sports Jacket", imageURL: "item2", price: 69, company: "Jacks Jonse", rating: 5, type: "new", isFevorite: false, color: "Red", size: "L"),
            FavoriteModel(name: "Cool Sports Jacket Cool Sports Jacket", imageURL: "item", price: 59, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "XL"),
            FavoriteModel(name: "Cool Sports Jacket Cool Sports Jacket", imageURL: "item", price: 59, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "S"),
            FavoriteModel(name: "Sports Jacket", imageURL: "item", price: 49, company: "Jacks Jonse", rating: 3, type: "sale", isFevorite: false, color: "Green", size: "M")
        ]
    }
}
