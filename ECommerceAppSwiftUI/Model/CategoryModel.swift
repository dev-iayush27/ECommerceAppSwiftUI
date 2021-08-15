//
//  CategoryModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 19/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

struct CategoryModel: Identifiable {
    let id = UUID()
    let men: [Category]
    let women: [Category]
    let kids: [Category]
}

struct Category {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageUrl: String
}

extension CategoryModel {
    static func all() -> CategoryModel {
        return CategoryModel(
            men: [
                Category(title: "New arrival for men", subtitle: "", imageUrl: "men1"),
                Category(title: "Cloths for men", subtitle: "", imageUrl: "men2"),
                Category(title: "Shoes for men", subtitle: "", imageUrl: "men3"),
                Category(title: "Accesories for men", subtitle: "", imageUrl: "men4")
            ],
            women: [
                Category(title: "New arrival for women", subtitle: "", imageUrl: "cat1"),
                Category(title: "Cloths for women", subtitle: "", imageUrl: "cat2"),
                Category(title: "Shoes for women", subtitle: "", imageUrl: "cat3"),
                Category(title: "Accesories for women", subtitle: "", imageUrl: "cat4")
            ],
            kids: [
                Category(title: "New Arrival for kids", subtitle: "", imageUrl: "kid1"),
                Category(title: "Cloths for kids", subtitle: "", imageUrl: "kid2"),
                Category(title: "Shoes for kids", subtitle: "", imageUrl: "kid3"),
                Category(title: "Accesories for kids", subtitle: "", imageUrl: "kid4")
            ]
        )
    }
}
