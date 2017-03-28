//
//  VideoModel.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/22.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class VideoModel: NSObject {

    var height: Int = 0
    var width: Int = 0
    var name: String = ""
    var type: String = ""
    var url: String = ""
    
    override init(){
        super.init()
    }
    
    init(dict:[String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }

}
