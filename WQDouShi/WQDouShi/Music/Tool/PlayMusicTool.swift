//
//  PlayMusicTool.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/20.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayMusicTool: NSObject {
    static let _playingMusic = NSMutableDictionary()

}


extension PlayMusicTool
{
    //播放音乐
    class func playMusicWithLink(link: String) ->AVPlayerItem{
        let queue = AVQueuePlayer()
        var playItem: AVPlayerItem? = PlayMusicTool._playingMusic[link] as? AVPlayerItem
        if playItem == nil{
            playItem = AVPlayerItem(url:URL(string:link)!)
            PlayMusicTool._playingMusic.setValue(playItem, forKey: link)
            queue.replaceCurrentItem(with: playItem)
        }
        queue.play()
        return playItem!
    }
}
