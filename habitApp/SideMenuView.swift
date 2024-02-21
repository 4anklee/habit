//
//  SideMenuView.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/3/17.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var showMenu: Bool
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            VStack (alignment: .leading, spacing: 10) {
                Circle()
                    .frame(width: 65, height: 65)
                Text("Frank")
                    .font(.title2.bold())
                
                Text("@4anklee")
                    .font(.callout)
                
                Divider()
                    .padding(10)
                
                List {
                    Button ("Profile", systemImage: "person.crop.circle", action: {print("hello")})
                        .padding(.vertical, 10)
                        .listRowBackground(Color.clear)
                    
                    
                    Button ("Account", systemImage: "person.crop.circle.badge", action: {print("hello")})
                        .padding(.vertical, 10)
                        .listRowBackground(Color.clear)
                    
                    
                    HStack {
                        Button ("Dark Mode", systemImage: "moonphase.waxing.crescent", action: {print("hello")})
                        Spacer()
                        Toggle("", isOn: $isDarkMode)
                            .labelsHidden()
                    }
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 10)
                

                    
                    NavigationLink(destination: SettingsView(showMenu: $showMenu)) {
                        Label("Settings", systemImage: "gear")
                    }
                    .padding(.vertical, 10)
                    .listRowBackground(Color.clear)



                    
                    Button ("Terms & Privacy ", systemImage: "person.2.badge.key.fill", action: {print("hello")})
                        .padding(.vertical, 10)
                        .listRowBackground(Color.clear)

                    
                    Button ("Log out", systemImage: "door.left.hand.open", action: {print("hello")})
                        .padding(.vertical, 10)
                        .listRowBackground(Color.clear)
    
                }
                .listStyle(PlainListStyle())
                .font(.system(size: 20))
                .padding(.leading, -10)
                
            }
            .padding(.horizontal)
            .padding(.leading)
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            
            
        }
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            misty_fjord
                .opacity(0.4)
            .ignoresSafeArea(.container, edges: .vertical))
            
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showMenu: .constant(false))
    }
}

extension View{
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}


