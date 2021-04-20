//
//  ItemRow.swift
//  ECommerceAppSwiftUI
//
//  Created by M_AMBIN03921 on 20/04/21.
//  Copyright © 2021 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    
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
                    .cornerRadius(5)
                    .overlay(
                        FevoriteButton()
                            .padding([.top, .trailing], 5)
                        , alignment: .topTrailing
                    )
                Text(cloth.company)
                    .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding([.horizontal], 5)
                Text(cloth.name)
                    .font(.custom(Constants.AppFont.regularFont, size: 11))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding([.horizontal], 5)
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
                .padding([.leading, .trailing], 5)
                Spacer()
            }
            .frame(width: 170, height: 255)
            .background(Color.clear)
            .clipped()
            .onTapGesture {
                self.show.toggle()
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(cloth: Cloth(name: "Printed Long Top", description: "Red floral print long top, has a round collar, full sleeves and available in different sizes for women.", imageURL: "redDress", price: 2399, company: "Rain & Rainbow", rating: 4, type: "sale", isFavorite: false, color: "Red", size: "S", discount: 40))
    }
}
