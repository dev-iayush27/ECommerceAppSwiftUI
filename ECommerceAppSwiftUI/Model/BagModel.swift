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
    let description: String
    let imageURL: String
    let price: Int
    let company: String
    let rating: Int
    let type: String
    let isFavorite: Bool
    let color: String
    let size: String
    let discount: Int
}

extension BagModel {
    static func all() -> [BagModel] {
        return [
            BagModel(name: "Printed Long Top", description: "Red floral print long top, has a round collar, full sleeves and available in different sizes for women.", imageURL: "redDress", price: 2399, company: "Rain & Rainbow", rating: 4, type: "sale", isFavorite: false, color: "Red", size: "S", discount: 40),
            BagModel(name: "Men Pullover Sweater", description: "Green ribbed pullover sweater, has a round neck, long sleeves, straight hem.", imageURL: "tshirts", price: 3449, company: "Mark & Spencer", rating: 5, type: "sale", isFavorite: true, color: "Green", size: "M", discount: 30),
            BagModel(name: "Black Fit Top", description: "Black coloured self design woven fit and flare top has round neck and half sleeves.", imageURL: "blackTop", price: 2799, company: "Kook N Keen Garfield", rating: 3, type: "sale", isFavorite: false, color: "Black", size: "L", discount: 45)
        ]
    }
}
