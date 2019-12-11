//
//  BagView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct BagView: View {
    
    let arrCloth = BagModel.all()
    @State var promoCode: String = ""
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UINavigationBar.appearance().barTintColor = .white
    }
    
    fileprivate func PromoCodeView() -> some View {
        
        return HStack {
            
            TextField("Enter promo code", text: $promoCode)
                .padding(.leading, 20)
                .font(.system(size: 15))
                .frame(height: 50)
            
            Button(action: {
                
            }) {
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.black)
            }
            .clipShape(Circle())
            .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
        }
        .background(Color.white)
        .cornerRadius(25)
        .padding(.horizontal, 10)
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    fileprivate func CheckOutButton() -> some View {
        Button(action: {
            
        }) {
            Text("Check Out")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(25)
        }
        .padding([.horizontal, .vertical], 10)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .top) {
                    VStack {
                        List(self.arrCloth) { cloth in
                            ItemCellTypeThree(cloth: cloth)
                        }
                            .frame(height: 480) // It should be dynamic...
                            .padding(.horizontal, -5)
                        PromoCodeView()
                        HStack {
                            Text("Total amount:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("$199")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .bold()
                        }.padding([.horizontal, .vertical], 15)
                        
                        CheckOutButton()
                        Spacer()
                    }
                }
            }
            .navigationBarTitle(Text("Bag"), displayMode: .inline)
        }
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        BagView()
    }
}

struct ItemCellTypeThree: View {
    
    let cloth: BagModel
    
    fileprivate func plusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "plus")
                .foregroundColor(.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .clipShape(Circle())
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    fileprivate func minusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "minus")
                .foregroundColor(.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .clipShape(Circle())
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    var body: some View {
        
        ZStack() {
            
            Rectangle()
                .foregroundColor(.white)
//                .cornerRadius(5)
//                .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            
            HStack(alignment: .top) {
                Image(cloth.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 140)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(cloth.name)
                            .font(.headline)
                            .lineLimit(nil)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image("menu")
                                .foregroundColor(Color.init(hex: "bbbbbb"))
                        }
                    }
                    HStack {
                        Text("Color:")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(cloth.color)
                            .font(.footnote)
                            .foregroundColor(.black)
                        
                        Text("Size:")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(cloth.size)
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    HStack {
                        minusButton()
                        Text("1")
                            .padding(.horizontal, 5)
                        plusButton()
                        Spacer()
                        Text("$\(cloth.price)")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .bold()
                    }
                    .padding(.bottom, 10)
                }
                .padding(.init(top: 12, leading: 5, bottom: 5, trailing: 0))
                Spacer()
            }
            .frame(height: 140)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
