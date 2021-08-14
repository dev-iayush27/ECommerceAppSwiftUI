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
    }
    
    let arrCloth = BagModel.all()
    @State var isShowPromoCodeView : Bool = false
    var discount = 0
    var deliveryCharges = 0
    
    fileprivate func CheckOutButton() -> some View {
        Button(action: {
            
        }) {
            Text("")
                .font(.custom(Constants.AppFont.boldFont, size: 15))
                .foregroundColor(.white)
                .frame(height: 65)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(0)
        }
        .padding(.horizontal, 0)
        .overlay(
            Text("Checkout")
                .font(.custom(Constants.AppFont.boldFont, size: 15))
                .foregroundColor(.white)
                .padding(.top, -10)
        )
    }
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Cart")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
                .background(Color.clear)
            , alignment: .center)
    }
    
    var line: some View {
        VStack {
            Divider()
        }
        .padding(.horizontal, 0)
    }
    
    fileprivate func ApplyCoupon() -> some View {
        return Button(action: {
            self.isShowPromoCodeView.toggle()
        }) {
            HStack {
                Image("offer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.leading, 15)
                    .foregroundColor(Constants.AppColor.primaryBlack)
                
                Text("APPLY COUPON")
                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                    .foregroundColor(Constants.AppColor.primaryBlack)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.trailing, 15)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 45)
        .background(Color.white)
        //.overlay(RoundedRectangle(cornerRadius: 5)
        //.stroke(Color.init(hex: "1E90FF"), lineWidth: 0.5))
        .sheet(isPresented: $isShowPromoCodeView) {
            PromoCodeView()
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                NavigationBarView()
                
                ZStack {
                    Constants.AppColor.lightGrayColor
                    
                    ScrollView {
                        ZStack(alignment: .top) {
                            VStack {
                                
                                List(self.arrCloth) { cloth in
                                    ItemCellTypeThree(cloth: cloth)
                                }
                                //.colorMultiply(Color.init(hex: "f9f9f9"))
                                .frame(height: 419) // It should be dynamic...
                                .padding(.trailing, -5)
                                .padding(.bottom, 10)
                                
                                ApplyCoupon()
                                
                                VStack {
                                    HStack {
                                        Text("Item Total")
                                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                        Spacer()
                                        Text("₹\(self.arrCloth.reduce(0, { $0 + $1.price }))")
                                            .font(.custom(Constants.AppFont.boldFont, size: 13))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                    }
                                    .padding(.top, 25)
                                    .padding(.horizontal, 15)
                                    
                                    HStack {
                                        Text("Delivery Charges")
                                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                        Spacer()
                                        Text("₹\(self.deliveryCharges)")
                                            .font(.custom(Constants.AppFont.boldFont, size: 13))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                    }
                                    .padding(.top, 10)
                                    .padding(.horizontal, 15)
                                    
                                    HStack {
                                        Text("Discount")
                                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                        Spacer()
                                        Text("- ₹\(self.arrCloth.reduce(0, { $0 + ($1.price * $1.discount)/100}))")
                                            .font(.custom(Constants.AppFont.boldFont, size: 13))
                                            .foregroundColor(Color.init(hex: "036440"))
                                    }
                                    .padding(.top, 10)
                                    .padding(.horizontal, 15)
                                    
                                    line.padding(10)
                                    
                                    HStack {
                                        Text("Total Amount")
                                            .font(.custom(Constants.AppFont.boldFont, size: 16))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                        Spacer()
                                        Text("₹\(self.arrCloth.reduce(0, { $0 + ($1.price - ($1.price * $1.discount)/100)}))")
                                            .font(.custom(Constants.AppFont.boldFont, size: 16))
                                            .foregroundColor(Constants.AppColor.secondaryBlack)
                                    }
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, 10)
                                    
                                    Spacer()
                                }.background(Color.white)
                                .padding(.top, 10)
                            }
                        }
                    }.padding(.top, 5)
                    Spacer()
                }
                CheckOutButton()
            }
            .navigationBarTitle("Cart", displayMode: .inline)
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
                .frame(width: 25, height: 25)
            //.background(Constants.AppColor.secondaryRed)
        }
        //        .clipShape(Circle())
        //        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    fileprivate func minusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "minus")
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
            //.background(Constants.AppColor.secondaryRed)
        }
        //        .clipShape(Circle())
        //        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    var line: some View {
        VStack {
            Divider()
        }
        .padding(.horizontal, 0)
    }
    
    var body: some View {
        
        ZStack() {
            //            Rectangle()
            //                .foregroundColor(.white)
            //                .cornerRadius(5)
            //                .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            HStack(alignment: .top) {
                Image(cloth.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 120)
                    .cornerRadius(1)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(cloth.company)
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                            .foregroundColor(Constants.AppColor.secondaryBlack)
                            .lineLimit(1)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(Color.init(hex: "bbbbbb"))
                                .padding(.top, 5)
                        }
                    }
                    
                    Text(cloth.name)
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.top, -5)
                    
                    HStack {
                        Text("Color:")
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(.gray)
                        Text(cloth.color)
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(Constants.AppColor.secondaryBlack)
                        
                        Text("Size:")
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(.gray)
                        Text(cloth.size)
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(Constants.AppColor.secondaryBlack)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                    HStack {
                        HStack {
                            minusButton()
                            Text("1")
                                .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                                .foregroundColor(Constants.AppColor.secondaryBlack)
                                .padding(.horizontal, 5)
                            plusButton()
                        }
                        .background(Constants.AppColor.lightGrayColor)
                        .cornerRadius(5)
                        .padding(.bottom, 10)
                        Spacer()
                        Text("₹\(cloth.price - (cloth.price * cloth.discount)/100)")
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                            .foregroundColor(Constants.AppColor.primaryBlack)
                    }
                    
                }
                .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
            }
            .overlay(
                line
                    .padding(.top, 10), alignment: .bottom)
            .frame(height: 130)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
