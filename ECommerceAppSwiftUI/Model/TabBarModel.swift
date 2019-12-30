//
//  TabBarModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 30/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct TabBarModel: Identifiable {
    
    let id = UUID()
    let name: String
    let imageUrl: String
}

extension TabBarModel {
    
    static func all() -> [TabBarModel] {
        return [
            TabBarModel(name: "Home", imageUrl: "house.fill"),
            TabBarModel(name: "Shop", imageUrl: "cart.fill"),
            TabBarModel(name: "Favorite", imageUrl: "heart.fill"),
            TabBarModel(name: "Profile", imageUrl: "person.fill")
        ]
    }
}
