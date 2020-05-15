//
//  TabBarView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .white
        //        UINavigationBar.appearance().barTintColor = .white
    }
    
    @State var selected = 0
    
    var body: some View {
        
        ZStack {
            Color.init(hex: "f9f9f9")
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection: $selected) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                }.tag(0)
                
                Shopping()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Shop")
                }.tag(1)
                
                FavoriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                }.tag(2)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                }.tag(3)
            }
        }
        .accentColor(Color.init(hex: "DB3022"))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        .edgesIgnoringSafeArea(.top)
//        .edgesIgnoringSafeArea(.bottom)
    }
}

//    @State var selected = "Home"
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                if self.selected == "Home" {
//                    HomeView()
//                } else if self.selected == "Shop" {
//                    GeometryReader { _ in
//                        Shopping()
//                    }
//                } else if self.selected == "Favorite" {
//                    GeometryReader { _ in
//                        FavoriteView()
//                    }
//                } else if self.selected == "Profile" {
//                    GeometryReader { _ in
//                        ProfileView()
//                    }
//                }
//                CustomTabView(selected: $selected)
//            }
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
//
//
//struct CustomTabView : View {
//
//    @Binding var selected : String
//    let arrTab = TabBarModel.all()
//
//    var body : some View {
//        HStack {
//            ForEach(arrTab, id: \.id) { tab in
//                VStack(spacing: 12) {
//                    Capsule()
//                        .fill(Color.clear)
//                        .frame(height: 0)
//                        .overlay(
//                            Capsule().fill(self.selected == tab.name ? Constants.AppColor.secondaryRed : Color.clear).frame(width: 55, height: 0)
//                    )
//                    Button(action: {
//                        self.selected = tab.name
//                    }) {
//                        VStack {
//                            Image(systemName: tab.imageUrl)
//                                .foregroundColor(self.selected == tab.name ? Constants.AppColor.secondaryRed : Constants.AppColor.secondaryBlack)
//                            Text(tab.name)
//                                .foregroundColor(self.selected == tab.name ? Constants.AppColor.secondaryRed : Constants.AppColor.secondaryBlack)
//                                .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
//                        }
//                    }
//                }
//            }
//        }.padding(.horizontal)
//    }
//}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
