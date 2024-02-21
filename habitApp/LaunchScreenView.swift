//
//  LaunchScreenView.swift
//  habit
//
//  Created by Frank on 2024/3/20.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager // Mark 1
    
    @State private var firstAnimation = false  // Mark 2
    @State private var secondAnimation = false // Mark 2
    @State private var startFadeoutAnimation = false // Mark 2
    @State private var animateGradient: Bool = false
    
    @State private var animate = false
    let maxRippleCount = 3
    let animationDuration = 1.5

    @ViewBuilder
    private var image: some View {  // Mark 3
        ZStack{
            ZStack {
                ForEach(0..<maxRippleCount, id: \.self) { index in
                    Circle()
                        .fill(Color.white.opacity(0.7))
                        .frame(width: 100, height: 100)
                        .scaleEffect(animate ? 10 : 1)
                        .opacity(animate ? 0 : 0.5) // Fade out as it expands
                        .animation(
                            Animation.easeInOut(duration: animationDuration)
                                .repeatForever(autoreverses: false)
                                .delay(Double(index) * (animationDuration / Double(maxRippleCount))),
                            value: animate
                        )
                }
                
                Circle()
                    .fill(Color.white.opacity(0.5))
                    .frame(width: 100, height: 100)
            }
            .onAppear {
                animate = true
            }
        
            
            
            Image("LogoWhite")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .scaleEffect(secondAnimation ? 0 : 1) // Mark 4
                .offset(y: secondAnimation ? 400 : 0) // Mark 4
        }
        .onAppear() {
            animate = true
        }
    
    }
    
    @ViewBuilder
    private var backgroundColor: some View {  // Mark 3
        LinearGradient(colors: [test_color, polar_blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
    
    private let animationTimer = Timer // Mark 5
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            backgroundColor  // Mark 3
            image  // Mark 3
        }.onReceive(animationTimer) { timerValue in
            updateAnimation()  // Mark 5
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    private func updateAnimation() { // Mark 5
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            // use this case to finish any work needed
            break
        }
    }
    
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}
