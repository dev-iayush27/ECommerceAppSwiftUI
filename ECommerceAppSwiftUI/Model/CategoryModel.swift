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
    let name: String
    let imageUrl: String
}

extension CategoryModel {
    
    static func all() -> [CategoryModel] {
        return [
            CategoryModel(name: "New", imageUrl: "cat1"),
            CategoryModel(name: "Cloths", imageUrl: "cat2"),
            CategoryModel(name: "Shoes", imageUrl: "cat3"),
            CategoryModel(name: "Accesories", imageUrl: "cat4")
        ]
    }
}
