//
//  LineView.swift
//  ECommerceAppSwiftUI
//
//  Created by M_AMBIN03921 on 15/08/21.
//  Copyright © 2021 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct LineView: View {
    let color: Color = Color.init(hex: "F9F9F9")
    var body: some View {
        Divider()
            .background(color)
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
