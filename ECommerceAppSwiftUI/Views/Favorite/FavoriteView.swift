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
    
    let arrFavorite = FavoriteModel.all()
    @State private var isModalPresented: Bool = false
    @State private var sortedBy: String = ""
    
    var arrSort = [
        "Popular",
        "Newest",
        "Customer Review",
        "Price: Lowest to high",
        "Price: Highest to low"
    ]
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Spacer()
            Button(action: {
                self.isModalPresented = true
            }) {
                HStack {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
            .frame(height: 30)
            .foregroundColor(Constants.AppColor.secondaryBlack)
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Favorite")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    var body: some View {
        return NavigationView {
            VStack {
                NavigationBarView()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        ForEach(self.arrFavorite, id: \.id) { cloth in
                            FavoriteRowNew(cloth: cloth)
                        }
                    }
                })
                .padding(.init(top: 5, leading: 15, bottom: 0, trailing: 15))
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
        .partialSheet(presented: $isModalPresented) {
            VStack {
                Text("Sort By")
                    .font(.headline)
                    .padding()
                
                VStack(alignment: .leading) {
                    ForEach(self.arrSort, id: \.self) { value in
                        Button(action: {
                            self.isModalPresented = false
                            self.sortedBy = value
                        }) {
                            Text(value)
                                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                                .padding()
                                .foregroundColor(self.sortedBy == value ? Constants.AppColor.secondaryRed : Constants.AppColor.secondaryBlack)
                                .font(.body)
                            Spacer()
                        }.frame(height: 40)
                    }
                    Spacer()
                }.padding(.leading, 10)
            }.frame(height: 250)
        }
    }
}

struct FavoriteRowNew: View {
    
    let cloth: FavoriteModel
    
    fileprivate func FevoriteButton() -> some View {
        return Button(action: {
            print("Name: \(self.cloth.name)")
        }) {
            Image(systemName: "multiply")
                .foregroundColor(.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(15)
        .opacity(0.8)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    fileprivate func AddToBagButton() -> some View {
        return Button(action: {
            print("Name: \(self.cloth.name)")
        }) {
            Image(systemName: "bag")
                .foregroundColor(.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(15)
        .opacity(0.8)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Image(cloth.imageURL).renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 100)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .cornerRadius(0)
                
                VStack(alignment: .leading) {
                    Text(cloth.company)
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.horizontal, 5)
                    
                    Text(cloth.name)
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.horizontal, 5)
                        .padding(.top, 1)
                    
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
                    .padding(.init(top: 1, leading: 5, bottom: 5, trailing: 5))
                }
                Spacer()
                VStack {
                    FevoriteButton()
                        .padding(.bottom, 5)
                    AddToBagButton()
                }
                .padding(.horizontal, 5)
            }
            LineView()
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 100, alignment: .leading)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
