//
//  HomeView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    let arrCloth = Cloth.all()
    
    fileprivate func SaleView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sale")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 5)
                    Text("Super Summer Sale")
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
                    ForEach(self.arrCloth.filter { $0.type == "sale" }) { cloth in
                        ItemCell(cloth: cloth)
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 65)
    }
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.title)
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
        }.padding(.top, 10)
    }
    
    fileprivate func TopBannerView() -> some View {
        return Image("banner")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(height: 120)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                TopBannerView()
                SaleView()
                TrendingView()
            }
            Spacer()
        }
    }
}

struct ItemCell: View {
    
    var cloth: Cloth
    
    fileprivate func TopLabel() -> some View {
        return Text(cloth.type == "new" ? "New" : "-20%")
            .font(.headline)
            .padding([.trailing, .leading], 10)
            .frame(height: 30)
            .background(cloth.type == "new" ? Color.init(hex: "222222") : Color.init(hex: "DB3022"))
            .cornerRadius(15)
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 1, x: 0.5, y: 0.5)
    }
    
    fileprivate func FevoriteButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "heart")
                .foregroundColor(.gray)
                .frame(width: 45, height: 45)
                .background(Color.white)
        }
        .cornerRadius(22.5)
        .shadow(color: .gray, radius: 0.8, x: 0.5, y: 0.5)
        .offset(x: 126, y: 145)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image(cloth.imageURL)
                    .resizable()
                    .cornerRadius(8)
                    .frame(width: 185, height: 220)
                VStack {
                    TopLabel()
                        .padding([.top, .leading], 5)
                    FevoriteButton()
                }
            }
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
        }.frame(width: 185, height: 320)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
