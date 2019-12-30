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
                        ItemCell(cloth: cloth)
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
                        ItemCell(cloth: cloth)
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

struct ItemCell: View {
    
    var cloth: Cloth
    @State var show = false
    
    fileprivate func TopLabel() -> some View {
        return Text(cloth.type == "new" ? "New" : "-20%")
            .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
            .padding([.trailing, .leading], 8)
            .frame(height: 25)
            .background(cloth.type == "new" ? Constants.AppColor.primaryBlack : Color.init(hex: "DB3022"))
            .cornerRadius(12.5)
            .foregroundColor(.white)
        //.shadow(color: Color.init(hex: "444444"), radius: 1, x: 0.5, y: 0.5)
    }
    
    fileprivate func FevoriteButton() -> some View {
        return Button(action: {
            print("Name: \(self.cloth.name)")
        }) {
            Image(systemName: cloth.isFavorite == true ? "heart.fill" : "heart")
                .foregroundColor(cloth.isFavorite == true ? .red :.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        
        ZStack {
            NavigationLink(destination: ItemDetailsView(show: self.$show, cloth: cloth), isActive: self.$show) {
                Text("")
            }
            VStack(alignment: .leading) {
                Image(cloth.imageURL).renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 190)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .cornerRadius(1)
                    .overlay(
                        FevoriteButton()
                            .padding(5), alignment: .topTrailing)
                
                Text(cloth.company)
                    .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding([.horizontal], 10)
                    .padding(.top, 0)
                
                Text(cloth.name)
                    .font(.custom(Constants.AppFont.regularFont, size: 11))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding([.horizontal], 10)
                    .padding(.top, 2)
                HStack {
                    Text("₹\(cloth.price - (cloth.price * cloth.discount)/100)")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                        .foregroundColor(Constants.AppColor.primaryBlack)
                    Text("₹\(cloth.price)")
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(.gray) .strikethrough()
                    Text(cloth.type == "new" ? "" : "\(cloth.discount)% OFF")
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                }
                .padding(.top, 5)
                .padding([.leading], 10)
                .padding([.trailing], 5)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 268)
            .background(Color.white)
            .cornerRadius(2)
            .clipped()
            .onTapGesture {
                self.show.toggle()
            }
        }
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
