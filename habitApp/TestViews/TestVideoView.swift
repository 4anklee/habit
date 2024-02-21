//
//  TestVideoView.swift
//  habit
//
//  Created by Frank on 2024/3/19.
//

import SwiftUI

struct TestVideoPlayerView: View {
    var body: some View {
        VideoPlayerUIView(videoName: "SaltLakeCity", videoType: "mov")
            .edgesIgnoringSafeArea(.all)
    }
}

struct TestVideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TestVideoPlayerView()
    }
}

