//
//  SuccessView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 12/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("success")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
            Text("Success!")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 20)
            Text("Your order will be delivered soon. Thank you for choosing our app.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
