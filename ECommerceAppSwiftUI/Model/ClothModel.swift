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
    let description: String
    let imageURL: String
    let price: Int
    let company: String
    let rating: Int
    let type: String
    let isFevorite: Bool
    let color: String
    let size: String
}

extension Cloth {
    
    static func all() -> [Cloth] {
        return [
            Cloth(name: "Cool Sports Jacket Cool Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "S"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "sale", isFevorite: false, color: "Green", size: "M"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item2", price: 99, company: "Jacks Jonse", rating: 5, type: "new", isFevorite: false, color: "Red", size: "L"),
            Cloth(name: "Cool Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item2", price: 99, company: "Jacks Jonse", rating: 4, type: "sale", isFevorite: true, color: "Red", size: "XL"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "new", isFevorite: false, color: "Blue", size: "S"),
            Cloth(name: "Cool Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "M"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item2", price: 99, company: "Jacks Jonse", rating: 3, type: "sale", isFevorite: false, color: "White", size: "L"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item2", price: 99, company: "Jacks Jonse", rating: 5, type: "new", isFevorite: false, color: "Red", size: "XL"),
            Cloth(name: "Cool Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item2", price: 99, company: "Jacks Jonse", rating: 4, type: "sale", isFevorite: true, color: "Green", size: "S"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "new", isFevorite: false, color: "Black", size: "M"),
            Cloth(name: "Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 3, type: "sale", isFevorite: false, color: "Orange", size: "L"),
        ]
    }
}
