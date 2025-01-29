//
//  VideoPlayer.swift
//  Agrume
//
//  Created by Zeynal Zeynalov on 29.01.25.
//  Copyright © 2025 Schnaub. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

enum VideoPlayer {
    static func playVideo(from url: URL, on viewController: UIViewController, onFail: @escaping () -> Void) {
        let asset = AVURLAsset(url: url, options: [AVURLAssetPreferPreciseDurationAndTimingKey: false])
        
        asset.loadValuesAsynchronously(forKeys: ["playable"]) {
            DispatchQueue.main.async {
                var error: NSError?
                let status = asset.statusOfValue(forKey: "playable", error: &error)
                
                if status == .loaded {
                    let playerItem = AVPlayerItem(asset: asset)
                    let player = AVPlayer(playerItem: playerItem)
                    let controller = AVPlayerViewController()
                    controller.player = player
                    
                    viewController.present(controller, animated: true) {
                        player.play()
                    }
                } else {
                    onFail()
                }
            }
        }
    }
}
