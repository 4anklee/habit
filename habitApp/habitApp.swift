//
//  CS160MobileAppApp.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/2/20.
//

import SwiftUI

@main
struct habit: App {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    @StateObject var launchScreenState = LaunchScreenStateManager()

    var body: some Scene {
        WindowGroup {
                        
            ZStack {
                ContentView()
                    .environment(\.colorScheme, isDarkMode ? .dark : .light)
                    .animation(.easeInOut(duration: 1), value: isDarkMode)
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        
        }
    }
}
