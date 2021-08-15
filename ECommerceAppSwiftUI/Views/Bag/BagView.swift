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
    @State var isShowPromoCodeView : Bool = false
    var discount = 0
    var deliveryCharges = 0
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Cart")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    fileprivate func CheckOutButton() -> some View {
        Button(action: {
            
        }) {
            Text("CHECKOUT")
                .font(.custom(Constants.AppFont.boldFont, size: 15))
                .foregroundColor(.white)
                .frame(height: 44)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(22)
        }
        .padding(.init(top: 0, leading: 15, bottom: 5, trailing: 15))
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
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 15)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 30)
        .sheet(isPresented: $isShowPromoCodeView) {
            PromoCodeView()
        }
    }
    
    var body: some View {
        VStack {
            NavigationBarView()
            ScrollView {
                ZStack(alignment: .top) {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(spacing: 10) {
                                ForEach(self.arrCloth, id: \.id) { cloth in
                                    ItemCellTypeThree(cloth: cloth)
                                }
                            }
                            .padding(.horizontal, 15)
                        })
                        .disabled(false)
                        .frame(height: (CGFloat(self.arrCloth.count) * 130) + 20) // It should be dynamic...
                        
                        LineView()
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                        ApplyCoupon()
                        LineView()
                            .padding(.horizontal, 15)
                        
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
                            .padding(.top, 10)
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
                            .padding(.top, 5)
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
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            LineView()
                                .padding(.vertical, 5)
                            
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
                            .padding(.bottom, 5)
                            
                            Spacer()
                        }
                        .padding(.top, 2)
                    }
                }
            }
            .padding(.top, 5)
            Spacer()
            CheckOutButton()
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
        }
    }
    
    fileprivate func minusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "minus")
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
        }
    }
    
    var body: some View {
        ZStack() {
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
            .frame(height: 130)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
