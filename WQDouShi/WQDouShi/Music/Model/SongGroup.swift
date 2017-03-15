//
//  SongGroup.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class SongGroup: NSObject {

    var name: String!
    var type: NSNumber!
    var count: NSNumber!
    
    var comment: String!
    var web_url: String!
    var song_id: String!
    var pic_s192: String!
    var pic_s444: String!
    
    var pic_s260: String!
    var pic_s210: String!
    
    var content: [[String : NSObject]]? {
        didSet {
            guard let content_list = content else { return }
            for dict in content_list {
                song_list.append(Song(dict: dict))
            }
        }
    }
    lazy var song_list : [Song] = [Song]()
    
    override init() {
        super.init()
    }
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
}
