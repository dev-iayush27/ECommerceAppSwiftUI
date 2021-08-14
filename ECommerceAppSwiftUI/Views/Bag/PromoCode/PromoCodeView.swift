//
//  PromoCodeView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 16/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct PromoCodeView: View {
    
    let arrPromoCode = PromoCodeModel.all()
    @State var promoCode: String = ""
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("PROMO CODES")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    fileprivate func PromoCodeView() -> some View {
        return HStack {
            TextField("Enter promo code", text: $promoCode)
                .padding(.leading, 15)
                .font(.custom(Constants.AppFont.regularFont, size: 15))
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .frame(height: 50)
            Spacer()
            Button(action: {
                
            }) {
                Text("Apply")
                    .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                    .foregroundColor(Constants.AppColor.secondaryRed)
                    .padding(.trailing, 15)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .shadow(color: Constants.AppColor.shadowColor, radius: 1, x: 0.8, y: 0.8)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBarView()
            self.PromoCodeView()
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 10) {
                    ForEach(self.arrPromoCode, id: \.id) { promoCode in
                        PromoCodeRow(promoCode: promoCode)
                    }
                }
                .padding(.horizontal, 15)
            })
        }
    }
}

struct PromoCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PromoCodeView()
    }
}

struct PromoCodeRow: View {
    
    let promoCode: PromoCodeModel
    
    fileprivate func ApplyButton() -> some View {
        Button(action: {
            
        }) {
            Text("Apply")
                .font(.custom(Constants.AppFont.boldFont, size: 10))
                .foregroundColor(.white)
                .frame(height: 25)
                .padding(.horizontal, 15)
                .background(Constants.AppColor.gradientRedHorizontal)
                .cornerRadius(15)
        }
    }
    
    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: Constants.AppColor.shadowColor, radius: 1, x: 0.8, y: 0.8)
            HStack(alignment: .center) {
                Image(promoCode.imageUrl)
                    .resizable()
                    .frame(width: 120)
                    .padding(.vertical, 0)
                    .overlay(
                        Text(promoCode.percentOff)
                            .foregroundColor(.white)
                            .font(.custom(Constants.AppFont.extraBoldFont, size: 30))
                        , alignment: .center)
                VStack(alignment: .leading) {
                    Text(promoCode.promoCodeTitle)
                        .font(.custom(Constants.AppFont.boldFont, size: 15))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .lineLimit(nil)
                        .padding(.bottom, 5)
                    Text(promoCode.promoCode)
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                }
                .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
                VStack(alignment: .trailing) {
                    ApplyButton()
                        .padding(.bottom, 5)
                    Text("Valid for \(promoCode.daysRemaining) days")
                        .font(.custom(Constants.AppFont.regularFont, size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
            }
            .frame(height: 90)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
