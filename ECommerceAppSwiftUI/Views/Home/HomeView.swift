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
    @State private var selection: Int? = nil
    
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
                    ScrollView {
                        VStack {
                            ImageSlider()
                            SaleView()
                            TrendingView()
                        }
                    }
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: Text("Test"), tag: 1, selection: $selection) {
                        Button(action: {
                            //                            self.selection = 1
                            print("Tapped on notification")
                        }) {
                            Image(systemName: "bell")
                        }
                        .frame(height: 30)
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                    },
                trailing:
                    NavigationLink(destination: BagView(), tag: 2, selection: $selection) {
                        Button(action: {
                            self.selection = 2
                            print("Tapped on bag")
                        }) {
                            Image(systemName: "bag")
                        }
                        .frame(height: 30)
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                    }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
