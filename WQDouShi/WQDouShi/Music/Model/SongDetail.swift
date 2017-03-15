//
//  SongDetail.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class SongDetail: NSObject {

    var title: String!
    var author: String!
    var song_id: String! {
        didSet {
            songIdArr.append(song_id)
        }
    }
    var album_id: String!
    var album_title: String!
    var pic_small: String!
    var num: NSNumber!
    
    var songIdArr = [String]()
    
    override init() {
        super.init()
    }
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
