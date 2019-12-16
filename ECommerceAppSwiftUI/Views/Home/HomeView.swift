//
//  HomeView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .white
    }
    
    let arrCloth = Cloth.all()
    
    fileprivate func SaleView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sale")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                    Text("Super Summer Sale")
                        .font(.caption)
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("See All")
                        .padding(.trailing, 15)
                        .foregroundColor(.gray)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 10) {
                    ForEach(self.arrCloth.filter { $0.type == "sale" }) { cloth in
                        ItemCell(cloth: cloth)
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 20)
    }
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                    Text("You have never seen it before")
                        .font(.caption)
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {}) {
                    Text("See All")
                        .padding(.trailing, 15)
                        .foregroundColor(.gray)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 10) {
                    ForEach(self.arrCloth.filter { $0.type == "new" }) { cloth in
                        ItemCell(cloth: cloth)
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 15)
    }
    
    fileprivate func TopBannerView() -> some View {
        return Image("banner")
            .resizable()
            .aspectRatio(4/3, contentMode: .fit)
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        TopBannerView()
                        SaleView()
                        TrendingView()
                    }
                }
            }
            .navigationBarTitle(Text("Home"), displayMode: .inline)
        }
    }
}

struct ItemCell: View {
    
    var cloth: Cloth
    
    fileprivate func TopLabel() -> some View {
        return Text(cloth.type == "new" ? "New" : "-20%")
            .font(.footnote)
            .padding([.trailing, .leading], 8)
            .frame(height: 25)
            .background(cloth.type == "new" ? Color.init(hex: "222222") : Color.init(hex: "DB3022"))
            .cornerRadius(12.5)
            .foregroundColor(.white)
            .shadow(color: Color.init(hex: "444444"), radius: 1, x: 0.5, y: 0.5)
    }
    
    fileprivate func FevoriteButton() -> some View {
        return Button(action: {
            print("Name: \(self.cloth.name)")
        }) {
            Image(systemName: cloth.isFevorite == true ? "heart.fill" : "heart")
                .foregroundColor(cloth.isFevorite == true ? .red :.gray)
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(20)
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(cloth.imageURL)
                .resizable()
                .cornerRadius(8)
                .frame(width: 185, height: 220)
                .overlay(
                    TopLabel()
                        .padding(5), alignment: .topLeading)
                .overlay(
                    FevoriteButton()
                        .padding([.bottom], -15)
                    , alignment: .bottomTrailing)
            HStack {
                RatingView(rating: .constant(cloth.rating))
                    .padding([.top, .bottom, .leading], 5)
                Text("(\(cloth.rating))")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding([.leading], 0)
            }
            Text(cloth.company)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding([.bottom, .leading], 5)
            Text(cloth.name)
                .font(.headline)
                .padding([.leading], 5)
            HStack {
                Text("$\(cloth.price)")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .strikethrough()
                Text("$\(cloth.price)")
                    .font(.headline)
                    .foregroundColor(Color.init(hex: "DB3022"))
            }.padding([.top, .leading], 5)
        }
        .frame(width: 185, height: 320)
        .background(Color.white)
        .cornerRadius(8)
        .clipped()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            //            HomeView()
            //                .environment(\.colorScheme, .dark)
            //            HomeView()
            //                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        }
    }
}
