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
        UINavigationBar.appearance().barTintColor = .white
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
                
                ShopView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Shop")
                }.tag(1)
                
                BagView()
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Bag")
                }.tag(2)
                
                FavoriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorite")
                }.tag(3)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                }.tag(4)
            }
        }
        .accentColor(Color.init(hex: "DB3022"))
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
