//
//  SettingsView.swift
//  habit
//
//  Created by Frank on 2024/3/19.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showMenu: Bool

    
    var body: some View {
        NavigationView{
            
            List {
                Section {
                    HStack{
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
                    HStack{
                        Image(systemName: "sparkles.rectangle.stack")
                        Text("My Subscription")
                    }
                }
                
                Section {
                    HStack{
                        Image(systemName: "gearshape")
                        Text("General")
                    }
                    HStack{
                        Image(systemName: "hand.raised")
                        Text("Privacy")
                    }
                    HStack{
                        Image(systemName: "bell")
                        Text("Notification")
                    }
                    HStack{
                        Image(systemName: "moonphase.waxing.crescent")
                        Text("Appearance")
                    }
                    HStack{
                        Image(systemName: "hammer")
                        Text("Advance")
                    }
                }
                
                Section{
                    HStack{
                        Image(systemName: "questionmark.circle")
                        Text("Help & Support")
                    }
                    
                    HStack{
                        Image(systemName: "person.crop.circle.badge.minus")
                        Text("Delete or Suspend Account")
                    }
                }
            }
            .multilineTextAlignment(.trailing)
        }
        .navigationTitle("Setting")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    SettingsView(showMenu: .constant(false))
}
