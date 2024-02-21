//
//  LogInView.swift
//  habit
//
//  Created by Frank on 2024/3/19.
//

import SwiftUI

struct LogInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var animateGradient: Bool = false
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [test_color, polar_blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
        
//            NavigationView {
            VStack {
                
                
                HStack{
                    Image("LogoWhite")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                }.frame(width: UIScreen.main.bounds.width, height: 100, alignment: .leading)
                
                Text("Welcome to habit!")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 100, alignment: .leading)
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .opacity(0.7)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .opacity(0.7)
                    .padding()
                
                Button(action: {
                    print("Login button tapped")
                }) {
                    Text("Login")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(.ultraThinMaterial)
                        .background(mint_meadow)
                        .cornerRadius(25)
                }
                .padding(.horizontal)
                
                Button(action: {
                    print("Sign up button tapped")
                }) {
                    Text("Create an account")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(.ultraThinMaterial)
                        .background(misty_fjord)
                        .cornerRadius(25)
                }
                .padding(.bottom)
                .padding(.horizontal)
                
                
                Button(action: {
                    print("Apple Login button tapped")
                }) {
                    Image(systemName: "apple.logo")
                        .resizable()
                        .frame(width:20, height: 25)
                        .scaledToFit()
                    
                    Text("Sign in with Apple")
                    
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(25)
                    .padding(.horizontal)
                
                Button(action: {
                    print("Goole Login button tapped")
                }) {
                    Image("GoogleIcon")
                        .resizable()
                        .frame(width:23, height: 23)
                        .scaledToFit()
                    
                    Text("Sign in with Google")
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.black)
                .background(Color.white.opacity(0.7))
                .cornerRadius(25)
                .padding(.horizontal)
                
                Button(action: {
                    print("Facebook Login button tapped")
                }) {
                    
                    Image("FacebookIcon")
                        .resizable()
                        .frame(width:25, height: 25)
                        .scaledToFit()
                    
                    Text("Sign in with Facebook")
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.black)
                .background(Color.white.opacity(0.7))
                .cornerRadius(25)
                .padding(.horizontal)
                
                Divider()
                    .padding()
                
                
                HStack{
                    Link(destination: URL(string: "google.com")!) {
                        Text("Forget Password?")
                    }
                    Divider()
                        .frame(width: 1)
                    Link(destination: URL(string: "google.com")!) {
                        Text("Get Help")
                    }
                }
                .frame(height: 15)
                .font(.system(size: 15))
                Link(destination: URL(string: "google.com")!) {
                    Text("Read Our Terms & Conditions")
                }
                .padding(.bottom)
                .font(.system(size: 15))
            

//                }
//                .navigationTitle("Login")
                }
        }
    }

}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
