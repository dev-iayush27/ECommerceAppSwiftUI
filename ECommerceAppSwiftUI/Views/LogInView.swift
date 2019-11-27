//
//  LogInView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 26/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct LogInView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var isShowForgetPasswordView : Bool = false
    
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
        .padding(.top, 40)
        .shadow(color: .gray, radius: 0.5)
    }
    
    fileprivate func PasswordTextField() -> some View {
        return HStack {
            Image(systemName: "lock.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(Color.init(hex: "DB3022"))
            SecureField("Password", text: $password)
                .padding(.leading, 12)
                .font(.system(size: 20))
                .frame(height: 55)
        }
        .background(Color.white)
        .cornerRadius(25)
        .padding([.leading, .trailing], 20)
        .padding(.top, 5)
        .shadow(color: .gray, radius: 0.5)
    }
    
    fileprivate func LoginButton() -> some View {
        return Button(action: {
            
        }) {
            Text("Login")
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
    
    fileprivate func ForgetPasswordButton() -> some View {
        return Button(action: {
            self.isShowForgetPasswordView.toggle()
        }) {
            Text("Forget your password?")
                .foregroundColor(.gray)
                .padding()
        }.sheet(isPresented: $isShowForgetPasswordView) {
            ForgetPasswordView()
        }
    }
    
    fileprivate func GoogleLogInButton() -> some View {
        return Button(action: {
            
        }) {
            Image("google")
                .renderingMode(.original)
        }
    }
    
    fileprivate func FacebookLogInButton() -> some View {
        return Button(action: {
            
        }) {
            Image("facebook")
                .renderingMode(.original)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "F9F9F9")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    EmailTextFiels()
                    PasswordTextField()
                    LoginButton()
                    ForgetPasswordButton()
                    Spacer()
                    Text("Login with social account")
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    HStack {
                        GoogleLogInButton()
                        FacebookLogInButton()
                    }
                }
            }
            .navigationBarTitle(Text("Login"), displayMode: .automatic)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
