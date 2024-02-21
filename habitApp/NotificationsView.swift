//
//  NotificationsView.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/3/17.
//

import SwiftUI

struct NotificationsView: View {
    
    @Binding var showMenu: Bool

    var body: some View {
        NavigationStack {
            
            ScrollView{
                Spacer(minLength: 30)
                HStack{
                    Image(systemName: "creditcard.trianglebadge.exclamationmark")
                        .frame(width: 50.0)
                        .scaledToFit()
                    VStack{
                        Text("Track your expenses")
                        Text("03/14/2024")
                            .font(.system(size:10))
                    }.frame(width: 250, alignment: .leading)
                }.frame(width: 350, height: 70)
                    .background(mint_meadow)
                    .cornerRadius(5)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                    }
                }
            }
            .navigationTitle("Notifications")
            
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(showMenu: .constant(false))
    }
}

