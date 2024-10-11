//
//  PlayVideo.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/25/24.
//

import SwiftUI
import AVKit

struct PlayVideo: View {
    @State var player = AVPlayer()
    var item = AVPlayerItem(url: Bundle.main.url(forResource: "Sunset", withExtension: "mp4")!)
    @State var isPlaying: Bool = false
    var body: some View {
        VideoPlayer(player: player)
                        .frame(width: 320, height: 180, alignment: .center)


                    Button {
                        isPlaying ? player.pause() : player.play()
                        isPlaying.toggle()
                        if isPlaying
                        {
                            player.replaceCurrentItem(with: item)
                        }
                        player.seek(to: .zero)
                    } label: {
                        Image(systemName: isPlaying ? "stop" : "play")
                            .padding()
                    }
    }
}

#Preview {
    PlayVideo()
}
