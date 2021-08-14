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
                .frame(width: 180, height: 180)
                .aspectRatio(contentMode: .fit)
            Text("Success!")
                .font(.largeTitle)
                .padding(.vertical, 10)
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
