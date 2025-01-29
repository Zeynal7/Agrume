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
  static func playVideo(from url: URL, on viewController: UIViewController) {
    let player = AVPlayer(url: url)
    let controller = AVPlayerViewController()
    controller.player = player
    viewController.present(controller, animated: true) {
      player.play()
    }
  }
}
