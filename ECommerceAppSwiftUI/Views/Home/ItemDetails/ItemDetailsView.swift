//
//  ItemDetailsView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 10/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @State var index = 0
    @State private var isModalPresentedForColor: Bool = false
    @State private var isModalPresentedForSize: Bool = false
    @State private var color: String = "Color"
    @State private var size: String = "Size"
    
    var arrImage = ["banner", "banner", "banner", "banner"]
    
    let cloth: Cloth
    let arrCloth = Cloth.all()
    
    fileprivate func SelectSizeButton() -> some View {
        return Button(action: {
            self.isModalPresentedForSize = true
        }) {
            HStack {
                Text(self.size)
                    .padding(.trailing, 8)
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
            .frame(height: 35)
            .padding(.horizontal, 12)
        }
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(17.5)
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
        //        .overlay(RoundedRectangle(cornerRadius: 17.5)
        //        .stroke(Color.init(hex: "cccccc"), lineWidth: 0.5))
    }
    
    fileprivate func SelectColorButton() -> some View {
        return Button(action: {
            self.isModalPresentedForColor = true
        }) {
            HStack {
                Text(self.color)
                    .padding(.trailing, 8)
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
            .frame(height: 35)
            .padding(.horizontal, 12)
        }
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(17.5)
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
        //        .overlay(RoundedRectangle(cornerRadius: 5)
        //        .stroke(Color.init(hex: "cccccc"), lineWidth: 0.5))
    }
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            
        }) {
            Image(systemName: self.cloth.isFevorite == true ? "heart.fill" : "heart")
                .foregroundColor(self.cloth.isFevorite == true ? .red :.gray)
                .frame(width: 35, height: 35)
                .background(Color.white)
        }
        .cornerRadius(20)
        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
    }
    
    fileprivate func ImageSlider() -> some View {
        return PagingView(index: $index.animation(), maxIndex: self.arrImage.count - 1) {
            ForEach(self.arrImage, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .aspectRatio(4/3, contentMode: .fit)
        
        //Stepper("Index: \(index)", value: $index.animation(.easeInOut), in: 0...arrImage.count-1)
        //.font(Font.body.monospacedDigit())
    }
    
    fileprivate func SimilerProduct() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                Text("Similar Products")
                    .font(.headline)
                    .bold()
                    .padding(.bottom, 5)
                
                Spacer(minLength: 10)
                
                Button(action: {
                    
                }) {
                    Text("See All")
                        .padding(.trailing, 15)
                        .foregroundColor(.gray)
                }
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 10) {
                    ForEach(self.arrCloth) { cloth in
                        ItemCell(cloth: cloth)
                    }
                }
            })
        }
    }
    
    fileprivate func AddToCartButton() -> some View {
        Button(action: {
            
        }) {
            Text("Add To Bag")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(25)
        }
        .padding([.horizontal], 10)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ImageSlider()
                            HStack {
                                SelectSizeButton()
                                SelectColorButton()
                                Spacer()
                                FavoriteButton()
                            }
                            .padding([.top, .leading, .trailing], 15)
                            
                            HStack(alignment: .top) {
                                Text(self.cloth.name)
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .bold()
                                Spacer(minLength: 10)
                                Text("$\(self.cloth.price)")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .bold()
                            }
                            .padding([.horizontal], 15)
                            .padding(.top, 10)
                            
                            Text(cloth.company)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding([.horizontal], 15)
                                .padding(.top, 5)
                            
                            HStack {
                                RatingView(rating: .constant(cloth.rating))
                                    .padding([.top, .bottom], 5)
                                Text("(\(cloth.rating))")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding([.leading], 2)
                            }
                            .padding(.leading, 15)
                            .padding(.top, 8)
                            
                            Text(cloth.description)
                                .font(.footnote)
                                .padding([.horizontal, .top], 15)
                                .foregroundColor(Color.init(hex: "0c0c0c"))
                                .lineSpacing(5)
                            
                            SimilerProduct()
                                .padding(.init(top: 25, leading: 15, bottom: 10, trailing: 0))
                        }
                    }
                    
                    AddToCartButton()
                }
            }
            .navigationBarTitle(Text(self.cloth.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    print("Share Action")
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
                }
            )
        }
            
        .partialSheet(presented: $isModalPresentedForSize) {
            VStack {
                Text("Select Size")
                    .font(.headline)
                    .padding()
                
                HStack {
                    Button(action: {
                        self.isModalPresentedForSize = false
                        self.size = "S"
                    }) {
                        Text("S")
                            .foregroundColor(Color.init(hex: "262626"))
                            .fontWeight(.medium)
                            .frame(width: 60, height: 40)
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.init(hex: "cccccc"), lineWidth: 0.5))
                    
                    Button(action: {
                        self.isModalPresentedForSize = false
                        self.size = "M"
                    }) {
                        Text("M")
                            .foregroundColor(Color.init(hex: "262626"))
                            .fontWeight(.medium)
                            .frame(width: 60, height: 40)
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.init(hex: "cccccc"), lineWidth: 0.5))
                    
                    Button(action: {
                        self.isModalPresentedForSize = false
                        self.size = "L"
                    }) {
                        Text("L")
                            .foregroundColor(Color.init(hex: "262626"))
                            .fontWeight(.medium)
                            .frame(width: 60, height: 40)
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.init(hex: "cccccc"), lineWidth: 0.5))
                    
                    Button(action: {
                        self.isModalPresentedForSize = false
                        self.size = "XL"
                    }) {
                        Text("XL")
                            .foregroundColor(Color.init(hex: "262626"))
                            .fontWeight(.medium)
                            .frame(width: 60, height: 40)
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.init(hex: "cccccc"), lineWidth: 0.5))
                }.padding(.top, 20)
            }
        }
            
        .partialSheet(presented: $isModalPresentedForColor) {
            VStack {
                Text("Select Color")
                    .font(.headline)
                    .padding()
                
                HStack {
                    
                    Button(action: {
                        self.isModalPresentedForColor = false
                        self.color = "Black"
                    }) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        self.isModalPresentedForColor = false
                        self.color = "Red"
                    }) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        self.isModalPresentedForColor = false
                        self.color = "Blue"
                    }) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        self.isModalPresentedForColor = false
                        self.color = "Yellow"
                    }) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                    }
                    
                    Button(action: {
                        self.isModalPresentedForColor = false
                        self.color = "Green"
                    }) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                    }
                    
                }.padding(.top, 20)
            }
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(cloth: Cloth(name: "Cool Sports Jacket", description: "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.", imageURL: "item", price: 99, company: "Jacks Jonse", rating: 4, type: "new", isFevorite: true, color: "Red", size: "S"))
    }
}
