//
//  Shopping.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 19/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct Shopping: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.init(hexString: "1f1f1f")], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
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
                .background(Color.white)
            , alignment: .center)
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBarView()
                Picker("", selection: $selectorIndex) {
                    Text("Woman").tag(0)
                    Text("Man").tag(1)
                    Text("Kids").tag(2)
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
                    List(self.arrCategory) { category in
                        CategoryRow(category: category, selectorIndex: self.selectorIndex)
                    }
                } else if selectorIndex == 1 {
                    List(self.arrCategory) { category in
                        CategoryRow(category: category, selectorIndex: self.selectorIndex)
                    }
                } else {
                    List(self.arrCategory) { category in
                        CategoryRow(category: category, selectorIndex: self.selectorIndex)
                    }
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
    
    var category: CategoryModel
    var selectorIndex = 0
    
    var line: some View {
        VStack {
            Divider()
                .background(Constants.AppColor.lightGrayColor)
        }
        .padding(.horizontal, 0)
    }
    
    var body: some View {
        
        HStack {
            Text(self.category.name)
                .font(.custom(Constants.AppFont.boldFont, size: 18))
                .foregroundColor(Constants.AppColor.secondaryBlack)
                .padding(.leading, 20)
            Spacer()
            Image(self.category.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
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
