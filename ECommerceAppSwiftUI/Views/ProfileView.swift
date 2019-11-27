//
//  ProfileView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI
import Combine

struct ProfileView: View {
    
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Details(), tag: 1, selection: $selection) {
                    Button("Press me") {
                        self.selection = 1
                    }
                }
            }
        }
    }
}

struct Details: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Group {
            Text("Details")
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
