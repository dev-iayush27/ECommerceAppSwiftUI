//
//  BagView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct BagView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UINavigationBar.appearance().barTintColor = .white
    }
    
    let arrCloth = BagModel.all()
    let arrPromoCode = PromoCodeModel.all()
    
    @State var promoCode: String = ""
    @State private var isModalPresented: Bool = false
    
    fileprivate func PromoCodeView() -> some View {
        
        return HStack {
            
            TextField("Enter promo code", text: $promoCode)
                .padding(.leading, 15)
                .font(.system(size: 15))
                .frame(height: 50)
            
            Spacer()
            
            Button(action: {
                self.isModalPresented = false
            }) {
                Text("Apply")
                    .fontWeight(.medium)
                    .foregroundColor(Color.init(hex: "ef473a"))
                    .padding(.trailing, 15)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
            
        .shadow(color: Color.init(hex: "dddddd"), radius: 1, x: 0.8, y: 0.8)
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
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView {
                        ZStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                List(self.arrCloth) { cloth in
                                    ItemCellTypeThree(cloth: cloth)
                                }
                                    .frame(height: 480) // It should be dynamic...
                                    .padding(.horizontal, -5)
                                //PromoCodeView()
                                Button(action: {
                                    self.isModalPresented = true
                                }) {
                                    Text("Have promo codes?")
                                }
                                .padding(.horizontal, 15)
                                .foregroundColor(Color.init(hex: "ef473a"))
                                
                                HStack {
                                    Text("Total amount:")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text("$199")
                                        .font(.title)
                                        .foregroundColor(Color.black)
                                        .bold()
                                }
                                .padding(.top, 20)
                                .padding(.horizontal, 15)
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                    CheckOutButton()
                        .padding([.horizontal, .bottom], 15)
                }
            }
            .navigationBarTitle(Text("Bag"), displayMode: .inline)
        }
            
        .partialSheet(presented: $isModalPresented) {
            ZStack {
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    self.PromoCodeView()
                    Text("Promo Codes")
                        .padding(.horizontal, 15)
                        .font(.headline)
                    List(self.arrPromoCode) { promoCode in
                        PromoCodeRow(promoCode: promoCode)
                    }
                }
            }.frame(height: 400)
        }
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        BagView()
    }
}

struct PromoCodeRow: View {
    
    let promoCode: PromoCodeModel
    
    fileprivate func ApplyButton() -> some View {
        Button(action: {
            
        }) {
            Text("Apply")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(height: 30)
                .padding(.horizontal, 15)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15)
        }
    }
    
    var body: some View {
        
        ZStack() {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: Color.init(hex: "dddddd"), radius: 1, x: 0.8, y: 0.8)
            
            HStack(alignment: .center) {
                Image(promoCode.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 72)
                    .padding(.vertical, 0)
                    .overlay(
                        Text(promoCode.percentOff)
                            .foregroundColor(.white)
                            .font(.body)
                            .bold()
                        , alignment: .center)
                VStack(alignment: .leading) {
                        Text(promoCode.promoCodeTitle)
                            .font(.body)
                            .bold()
                            .lineLimit(nil)
                            .padding(.bottom, 5)
                        Text(promoCode.promoCode)
                            .font(.footnote)
                }
                .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
                VStack(alignment: .trailing) {
                    ApplyButton()
                        .padding(.bottom, 5)
                    Text("Valid for \(promoCode.daysRemaining) days")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
            }
            .frame(height: 80)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
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
                .cornerRadius(5)
                .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            
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
