//
//  ContentView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    @State var selected = 0
    
    var body: some View {
        
        TabView(selection: $selected) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .font(.title)
                    Text("Home")
            }.tag(0)
            
            ShopView()
                .tabItem {
                    Image(systemName: "cart.fill")
                        .font(.title)
                    Text("Shop")
            }.tag(1)
            
            BagView()
                .tabItem {
                    Image(systemName: "bag.fill")
                        .font(.title)
                    Text("Bag")
            }.tag(2)
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .font(.title)
                    Text("Favorite")
            }.tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .font(.title)
                    Text("Profile")
            }.tag(4)
        }
        .accentColor(Color.init(hex: "DB3022"))
        .edgesIgnoringSafeArea(.top)
    .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
