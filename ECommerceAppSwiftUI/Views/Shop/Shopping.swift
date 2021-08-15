//
//  Shopping.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 19/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct Shopping: View {
    
    @State private var selectorIndex = 0
    
    let arrCategory = CategoryModel.all()
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Categories")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBarView()
                Picker("", selection: $selectorIndex) {
                    Text("Kids").tag(0)
                    Text("Women").tag(1)
                    Text("men").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                
                VStack {
                    Text("SUMMER SALES")
                        .font(.custom(Constants.AppFont.boldFont, size: 20))
                        .foregroundColor(Color.white)
                        .tracking(7)
                        .padding(.bottom, 5)
                    Text("Up to 50% off")
                        .font(.custom(Constants.AppFont.boldFont, size: 12))
                        .foregroundColor(Color.white)
                        .tracking(2)
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                .background(Constants.AppColor.gradientRedVertical)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                if selectorIndex == 0 {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            ForEach(self.arrCategory.kids, id: \.id) { category in
                                CategoryRow(category: category, selectorIndex: self.selectorIndex)
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                } else if selectorIndex == 1 {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            ForEach(self.arrCategory.women, id: \.id) { category in
                                CategoryRow(category: category, selectorIndex: self.selectorIndex)
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            ForEach(self.arrCategory.men, id: \.id) { category in
                                CategoryRow(category: category, selectorIndex: self.selectorIndex)
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea([.bottom, .horizontal])
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CategoryRow: View {
    
    var category: Category
    var selectorIndex = 0
    
    var body: some View {
        HStack {
            Text(self.category.title)
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .padding(.leading, 20)
            Spacer()
            Image(self.category.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 2 - 15)
        }
        .background(Constants.AppColor.lightGrayColor)
        .cornerRadius(10)
    }
}

struct Shopping_Previews: PreviewProvider {
    static var previews: some View {
        Shopping()
    }
}
