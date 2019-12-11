//
//  ProfileModel.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 02/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

struct ProfileModel: Identifiable {
    
    let id = UUID()
    let title: String
    let subtitle: String
}

extension ProfileModel {
    
    static func all() -> [ProfileModel] {
        return [
            ProfileModel(title: "My Orders", subtitle: "Already have 2 orders"),
            ProfileModel(title: "Shipping Addresses", subtitle: "3 addresses"),
            ProfileModel(title: "Payment Methods", subtitle: "Visa **34"),
            ProfileModel(title: "Promo Codes", subtitle: "You have special promo codes"),
            ProfileModel(title: "My Reviews", subtitle: "Reviews for 4 items"),
            ProfileModel(title: "Settings", subtitle: "Notification, Passwords")
        ]
    }
}
