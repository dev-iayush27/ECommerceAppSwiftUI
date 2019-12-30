//
//  Constants.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 20/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation
import SwiftUI

struct Constants {
    
    struct AppColor {
        static let primaryBlack = Color.init(hex: "1F1F1F")
        static let secondaryBlack = Color.init(hex: "464B5F")
        static let lightGrayColor = Color.init(hex: "F9F9F9")
        static let primaryRed = Color.init(hex: "CB2D3E")
        static let secondaryRed = Color.init(hex: "EF473A")
        static let gradientRedHorizontal = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "CB2D3E"), Color.init(hex: "EF473A")]), startPoint: .leading, endPoint: .trailing)
        static let gradientRedVertical = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "CB2D3E"), Color.init(hex: "EF473A")]), startPoint: .bottom, endPoint: .top)
        static let shadowColor = Color.init(hex: "dddddd")
        static let lightGreen = Color.init(hex: "e8fbe8")
    }
    
    struct AppFont {
        static let extraBoldFont = "OpenSans-ExtraBold"
        static let boldFont = "OpenSans-Bold"
        static let semiBoldFont = "OpenSans-SemiBold"
        static let regularFont = "OpenSans-Regular"
        static let lightFont = "OpenSans-Light"
    }
}
