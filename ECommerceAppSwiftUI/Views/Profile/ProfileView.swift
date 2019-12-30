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
//        UINavigationBar.appearance().barTintColor = .white
    }
    
    @State var selection: Int? = nil
    let arrProfile = ProfileModel.all()
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: 45)
        .overlay(
            Text("Profile")
                .font(.headline)
                .padding(.horizontal, 10)
                .background(Color.init(hex: "f9f9f9"))
            , alignment: .center)
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    NavigationBarView()
                    HStack {
                        Image("banner2")
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
                    }
                    .colorMultiply(Color.init(hex: "f9f9f9"))
                    .padding(.leading, -5)
                    
                    Spacer()
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
