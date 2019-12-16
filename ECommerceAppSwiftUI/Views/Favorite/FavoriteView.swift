//
//  FavoriteView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI
import PartialSheet

struct FavoriteView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .white
        UITableView.appearance().separatorStyle = .none
    }
    
    let arrFavorite = FavoriteModel.all()
    @State private var isModalPresented: Bool = false
    @State private var sortedBy: String = "Price: lowest to high"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            self.isModalPresented = true
                        }) {
                            HStack {
                                Image(systemName: "arrow.up.arrow.down")
                                    .padding(.leading, 10)
                                Text(self.sortedBy)
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(height: 30)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .font(.footnote)
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Tapped on filter")
                        }) {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                        }
                        .foregroundColor(.black)
                        .font(.body)
                    }
                    .padding([.top, .leading, .trailing], 10)
                    
                    List(self.arrFavorite) { cloth in
                        ItemRowForFavorite(cloth: cloth)
                    }
                    .padding(.horizontal, -5)
                }
            }
            .navigationBarTitle(Text("Favorite"), displayMode: .inline)
        }
            
        .partialSheet(presented: $isModalPresented) {
            VStack {
                Text("Sort By")
                    .font(.headline)
                    .padding()
                
                VStack(alignment: .leading) {
                    
                    Button(action: {
                        // Do some action
                        self.isModalPresented = false
                        self.sortedBy = "Popular"
                    }) {
                        Text("Popular")
                            .padding()
                            .foregroundColor(.black)
                            .font(.body)
                        Spacer()
                    }
                    
                    Button(action: {
                        // Do some action
                        self.isModalPresented = false
                        self.sortedBy = "Newest"
                        
                    }) {
                        Text("Newest")
                            .padding()
                            .foregroundColor(.black)
                            .font(.body)
                    }
                    
                    Button(action: {
                        // Do some action
                        self.isModalPresented = false
                        self.sortedBy = "Customer review"
                        
                    }) {
                        Text("Customer review")
                            .padding()
                            .foregroundColor(.black)
                            .font(.body)
                    }
                    
                    Button(action: {
                        // Do some action
                        self.isModalPresented = false
                        self.sortedBy = "Price: lowest to high"
                        
                    }) {
                        Text("Price: lowest to high")
                            .padding()
                            .foregroundColor(.black)
                            .font(.body)
                    }
                    
                    Button(action: {
                        // Do some action
                        self.isModalPresented = false
                        self.sortedBy = "Price: highest to low"
                        
                    }) {
                        Text("Price: highest to low")
                            .padding()
                            .foregroundColor(.black)
                            .font(.body)
                    }
                }.padding(.leading, 10)
            }
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
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    var body: some View {
        
        ZStack() {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            
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
