//
//  ForgetPasswordView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @State var email : String = ""
    
    fileprivate func EmailTextFiels() -> some View {
        return HStack {
            Image(systemName: "envelope.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(Color.init(hex: "DB3022"))
            TextField("Email", text: $email)
                .padding(.leading, 12)
                .font(.system(size: 20))
                .frame(height: 55)
        }
        .background(Color.white)
        .cornerRadius(25)
        .padding([.leading, .trailing], 20)
        .padding(.top, 10)
        .shadow(color: .gray, radius: 0.5)
    }
    
    fileprivate func SendButton() -> some View {
        return Button(action: {
            
        }) {
            Text("Send")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(25)
        }
        .padding([.leading, .trailing], 20)
        .padding(.top, 40)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "F9F9F9")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Please, enter your email address. You will receive a link to create a new password via email.")
                        .foregroundColor(.gray)
                        .padding([.trailing, .leading], 20)
                        .padding(.top, 50)
                        .lineLimit(nil)
                    EmailTextFiels()
                    SendButton()
                    Spacer()
                }
            }
            .navigationBarTitle(Text("Forget Password"), displayMode: .automatic)
        }
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
