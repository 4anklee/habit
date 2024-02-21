//
//  DashboardView.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/3/17.
//

import SwiftUI

struct DashboardView: View {
    
    
    @Binding var showMenu: Bool

    
    var body: some View {
        // First tab
        
        NavigationStack{
            
            ScrollView {
                
                VStack {
                    Text("Welcome to Today's Plan")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack {
                    Text("Daily Goals")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 350, height: 20, alignment: .leading)
                    ScrollView (.horizontal){
                        
                        HStack{
                            Circle()
                                .fill(misty_fjord)
                                .frame(width: 75, height: 75)
                            Circle()
                                .fill(misty_fjord)
                                .frame(width: 75, height: 75)
                            Circle()
                                .fill(misty_fjord)
                                .frame(width: 75, height: 75)
                            Circle()
                                .fill(misty_fjord)
                                .frame(width: 75, height: 75)
                            Circle()
                                .fill(misty_fjord)
                                .frame(width: 75, height: 75)
                            Circle()
                                .fill(misty_fjord)
                                .frame(width: 75, height: 75)
                        }
                        
                    }.frame(width: 350, height: 100, alignment: .leading)
                        .scrollIndicators(.hidden)
                    
                    Grid{
                        HStack{
                            Image(systemName: "figure.run")
                                .resizable()
                                .frame(width: 30, height: 40)
                                .scaledToFit()
                            Text("Set your goals")
                        }.frame(width: 350, height: 100)
                            .background(misty_fjord)
                            .cornerRadius(20)
                    }
                }
                
                VStack{
                    Text("Monthly Overview")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 350, height: 20, alignment: .leading)
                    Grid{
                        Text("Schedule Tasks")
                            .frame(width: 350, height: 100)
                            .background(misty_fjord)
                            .cornerRadius(20)
                    }
                }
                
                
                VStack{
                    Text("Task Overview")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 350, height: 20, alignment: .leading)
                    Grid {
                        GridRow {
                            Text("Create tasks")
                                .frame(width: 175, height: 100)
                                .background(misty_fjord)
                            
                            Text("Track tasks")
                                .frame(width: 175, height: 100)
                                .background(deep_aquamarine)
                        }.cornerRadius(20)
                        
                        GridRow {
                            Text("Goal")
                                .frame(width: 175, height: 100)
                                .background(sapphire_surf)
                            Text("Progress")
                                .frame(width: 175, height: 100)
                                .background(laced_green)
                        }.cornerRadius(20)
                        
                    }.frame(width: 350, alignment: .top)
                }
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
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(showMenu: .constant(false))
    }
}
