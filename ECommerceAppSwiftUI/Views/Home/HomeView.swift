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
        //UINavigationBar.appearance().barTintColor = .white
    }
    
    @State var index = 0
    var arrImage = ["collage", "collage", "collage", "collage"]
    let arrCloth = Cloth.all()
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Image(systemName: "bell")
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .frame(height: 30)
                .padding(.leading, 15)
            Spacer()
            Image(systemName: "bag")
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .frame(height: 30)
                .padding(.trailing, 15)
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Home")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    fileprivate func ImageSlider() -> some View {
        return PagingView(index: $index.animation(), maxIndex: self.arrImage.count - 1) {
            ForEach(self.arrImage, id: \.self) { image in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 210)
            }
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: UIScreen.main.bounds.width, height: 210)
    }
    
    fileprivate func TopBannerView() -> some View {
        return Image("collage").renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 180)
            .overlay(
                VStack(alignment: .center) {
                    Text("Men's Casual Wear")
                        .font(.custom(Constants.AppFont.regularFont, size: 22))
                        .foregroundColor(.white)
                    Text("40-80% OFF")
                        .font(.custom(Constants.AppFont.extraBoldFont, size: 18))
                        .foregroundColor(.white)
                }.padding(.bottom, 20)
                , alignment: .bottom)
    }
    
    fileprivate func SaleView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sale")
                        .font(.custom(Constants.AppFont.boldFont, size: 22))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.bottom, -1)
                    Text("Festive Season Sale")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                        .padding(.trailing, 15)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    ForEach(self.arrCloth.filter { $0.type == "sale" }, id: \.id) { cloth in
                        ItemRow(cloth: cloth)
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 10)
    }
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.custom(Constants.AppFont.boldFont, size: 22))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.bottom, -1)
                    Text("You have never seen it before")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                        .padding(.trailing, 15)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    ForEach(self.arrCloth.filter { $0.type == "new" }, id: \.id) { cloth in
                        ItemRow(cloth: cloth)
                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 10)
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Constants.AppColor.lightGrayColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationBarView()
                    ScrollView {
                        VStack {
                            ImageSlider()
                            //TopBannerView()
                            SaleView()
                            TrendingView()
                        }
                    }.edgesIgnoringSafeArea(.top)
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
