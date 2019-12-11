//
//  FavoriteView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .white
    }
    
    let arrFavorite = FavoriteModel.all()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(self.arrFavorite) { cloth in
                    ItemRowForFavorite(cloth: cloth)
                }
                .padding(.horizontal, -5)
            }
            .navigationBarTitle(Text("Favorite"), displayMode: .inline)
        }
    }
}

struct ItemRowForFavorite: View {
    
    let cloth: FavoriteModel
    
    fileprivate func AddingToBagButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "bag.fill")
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
                .background(Color.init(hex: "DB3022"))
        }
        .cornerRadius(20)
        .shadow(color: Color.init(hex: "444444"), radius: 1.5, x: 0.8, y: 0.8)
    }
    
    var body: some View {
        
        ZStack() {
            
            Rectangle()
                .foregroundColor(.white)
//                .cornerRadius(5)
//                .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            
            HStack() {
                Image(cloth.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 150)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(cloth.name)
                        .font(.headline)
                        .lineLimit(2)
                    Text(cloth.company)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding([.top], 5)
                    Spacer()
                    HStack {
                        RatingView(rating: .constant(4))
                        Text("(\(cloth.rating))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("$\(cloth.price)")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .bold()
                            .padding(.top, 5)
                        Spacer()
                        AddingToBagButton()
                    }
                }
                .padding(.init(top: 10, leading: 5, bottom: 5, trailing: 0))
                Spacer()
            }
            .frame(height: 150)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
