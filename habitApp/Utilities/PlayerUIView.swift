//
//  PlayerUIView.swift
//  habit
//
//  Created by Frank on 2024/3/19.
//

import SwiftUI
import AVFoundation
import UIKit

struct VideoPlayerUIView: UIViewRepresentable {
    var videoName: String
    var videoType: String
    
    func makeUIView(context: Context) -> UIView {
        return UIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let path = Bundle.main.path(forResource: videoName, ofType: videoType) else {
            fatalError("Video file \(videoName).\(videoType) not found.")
        }
        
        print(path)
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = uiView.bounds
        playerLayer.videoGravity = .resizeAspectFill
        uiView.layer.addSublayer(playerLayer)
        
        player.play()
        
        // Loop the video
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: CMTime.zero)
            player.play()
        }
    }
}
