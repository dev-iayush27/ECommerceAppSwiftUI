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
    
    init() {
        UINavigationBar.appearance().barTintColor = .white
    }
    
    @State var selection: Int? = nil
    let arrProfile = ProfileModel.all()
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Image("item")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding(.leading, 15)
                    VStack(alignment: .leading) {
                        Text("Ayush Gupta")
                            .font(.headline)
                            .bold()
                        Text("guptaayush374@gmail.com")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }.padding(.horizontal, 5)
                    Spacer()
                }.padding(.vertical, 10)
                
                List(self.arrProfile) { profile in
                    NavigationLink(destination: FavoriteView()) {
                        VStack(alignment: .leading) {
                            Text(profile.title)
                                .font(.subheadline)
                                .bold()
                            Text(profile.subtitle)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }.padding([.horizontal, .vertical], 10)
                    }
                }.padding(.leading, -5)
                
                Spacer()
            }
            .navigationBarTitle(Text("Profile"), displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
