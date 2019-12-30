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
        //UINavigationBar.appearance().barTintColor = .white
        UITableView.appearance().separatorStyle = .none
    }
    
    let arrFavorite = FavoriteModel.all()
    @State private var isModalPresented: Bool = false
    @State private var sortedBy: String = ""
    
    var arrSort = ["Popular", "Newest", "Customer Review", "Price: Lowest to high", "Price: Highest to low"]
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Button(action: {
                self.isModalPresented = true
            }) {
                HStack {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
            .frame(height: 30)
            .foregroundColor(Constants.AppColor.secondaryBlack)
            
            Spacer()
            
            Button(action: {
                print("Tapped on filter")
            }) {
                Image("filter")
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
        let chunkedCloth = arrFavorite.chunked(into: 2)
        return NavigationView {
            VStack {
                NavigationBarView()
                ZStack {
                    Constants.AppColor.lightGrayColor
                        .edgesIgnoringSafeArea(.all)
                    List {
                        // Rows
                        ForEach(0..<chunkedCloth.count) { index in
                            HStack(spacing: 1) {
                                // Columns
                                ForEach(chunkedCloth[index]) { cloth in
                                    FavoriteRowNew(cloth: cloth)
                                }
                            }
                        }
                    }.padding(.leading, -16)
                }
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
            Image(systemName: self.cloth.isFavorite == true ? "heart.fill" : "heart")
                .foregroundColor(cloth.isFavorite == true ? .red : .gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    fileprivate func AddToBagButton() -> some View {
        return Button(action: {
            print("Name: \(self.cloth.name)")
        }) {
            Image(systemName: "bag.fill")
                .foregroundColor(cloth.isFavorite == true ? .red : .gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(cloth.imageURL).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .cornerRadius(0)
                .overlay(
                    self.FevoriteButton()
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                    , alignment: .topTrailing)
            
            Text(cloth.company)
                .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .padding(.leading, 12)
                .padding(.trailing, 10)
                .padding(.top, 0)
            
            Text(cloth.name)
                .font(.custom(Constants.AppFont.regularFont, size: 11))
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .padding(.leading, 12)
                .padding(.trailing, 10)
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
            .padding(.vertical, 5)
            .padding(.leading, 12)
            .padding(.trailing, 10)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width/2)
        .background(Color.white)
        .cornerRadius(0)
        .clipped()
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

struct FavoriteRow: View {
    
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
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            print("Name: \(self.cloth.name)")
        }) {
            Image(systemName: cloth.isFavorite == true ? "heart.fill" : "heart")
                .foregroundColor(cloth.isFavorite == true ? .red :.gray)
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(20)
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(cloth.imageURL).renderingMode(.original)
                .resizable()
                .cornerRadius(8)
                .frame(width: UIScreen.main.bounds.width / 2, height: 220)
                .overlay(
                    TopLabel()
                        .padding(5), alignment: .topLeading)
                .overlay(
                    FavoriteButton()
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
                .foregroundColor(.black)
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
        .frame(width: UIScreen.main.bounds.width / 2, height: 320)
        .background(Color.white)
        .cornerRadius(8)
        .clipped()
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
