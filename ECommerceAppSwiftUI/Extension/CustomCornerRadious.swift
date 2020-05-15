//
//  CustomCornerRadious.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 24/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation
import SwiftUI

struct rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
