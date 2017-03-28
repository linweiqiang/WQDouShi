//
//  VideoListModel.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/22.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class VideoListModel: NSObject {

    var title : String?
    var videoDescription: String?
    var videoUrl: String?
    //封面
    var coverForFeed: String?
    var date: NSNumber?
    
    var playInfo: [VideoModel] = [VideoModel]()
    
    override init(){
        super.init()
    }
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "playInfo" {
            var models = [VideoModel]()
            for dict in value as! [[String: AnyObject]] {
                models.append(VideoModel(dict: dict))
            }
            playInfo = models
            return
        }
        if key == "data" {
            date = value as! NSNumber?
        }
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            self.videoDescription = value as! String?
        }
    }
}
