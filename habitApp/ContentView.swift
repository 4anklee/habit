//
//  ContentView.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/2/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    @State private var showMenu = false
    
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset:CGFloat = 0
    
    var body: some View {
        
        VStack {
            Image(systemName: "applescript")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 150, height: 150)
            Text("Hello, Apple Script!").font(.largeTitle)
        }
        .padding()
        .task {
            try? await getDataFromApi()
            try? await Task.sleep(for: Duration.seconds(1))
            self.launchScreenState.dismiss()
        }
        
        
        let sideMenuWidth = getRect().width - 90
        
        NavigationView {
            
            HStack (spacing: 0){
                
                SideMenuView(showMenu: $showMenu)
                
                VStack{
                    TabView {
                        
                        DashboardView(showMenu: $showMenu)
                            .tabItem {
                                Image(systemName: "rectangle.3.offgrid.fill")
                                Text("Dashboard")
                            }
                        
                        CalendarView(showMenu: $showMenu)
                            .tabItem {
                                Image(systemName: "calendar")
                                Text("Calendar")
                            }
                        
                        NotificationsView(showMenu: $showMenu)
                            .tabItem {
                                Image(systemName: "bell")
                                Text("Notifications")
                            }
                        
                        AddTaskView(showMenu: $showMenu)
                            .tabItem {
                                Image(systemName: "plus")
                                Text("Add")
                            }
                    }
                    .frame(width: getRect().width)
                }
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double(offset / sideMenuWidth / 5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showMenu.toggle()
                            }
                        }
                )
                
            }
            .accentColor(mint_meadow)
            .frame(width: getRect().width)
            .offset(x: -sideMenuWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out,
                        _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
            
            if isDarkMode {
                Color.black
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: isDarkMode)
            } else {
                Color.white
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: isDarkMode)
            }
            
        }
        .animation(.easeInOut, value: offset == 0)
        .onChange(of: showMenu, {
            if showMenu && offset == 0 {
                offset = sideMenuWidth
            }
            
            if !showMenu && offset == sideMenuWidth {
                offset = 0
                lastStoredOffset = 0
            }
        })
        .onChange(of: gestureOffset) {
            onChange()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .animation(.easeInOut(duration: 1), value: isDarkMode)
        
    }
    
    
    
    func onEnd(value: DragGesture.Value){
        let sideMenuWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation( .easeInOut,
                       {
            if translation > 0 {
                if translation > (sideMenuWidth / 2){
                    offset = sideMenuWidth
                    showMenu = true
                }
                else{
                    if offset == sideMenuWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            }
            else{
                if -translation > (sideMenuWidth / 2) {
                    offset = 0
                    showMenu = false
                }
                else{
                    if offset == 0 || !showMenu{
                        return
                    }
                    offset = sideMenuWidth
                    showMenu = true
                }
            }
        }
        )
        lastStoredOffset = offset
    }
    
    func onChange(){
        let sideMenuWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideMenuWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    fileprivate func getDataFromApi() async throws {
        let googleURL = URL(string: "https://www.google.com")!
        let (_,response) = try await URLSession.shared.data(from: googleURL)
        print(response as? HTTPURLResponse? as Any)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenStateManager())
    }
}
