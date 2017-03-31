//
//  CreamViewModel.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/30.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class CreamViewModel: NSObject {

    var currentpage: Int = 1
    
    var creams = [CreamModel]()
    
}

extension CreamViewModel
{
    func getCreamData(finishedCallBack: @escaping(_ error: Error?) -> ()) {
        NetWorkTool.requestData(type: .get, urlString: "http://live.9158.com/Fans/GetHotLive?page=\(self.currentpage)", succeed: { (result, error) in
            guard let result = result as? [String: Any] else {return}
            guard let data = result["data"] as? [String: Any] else {return}
            guard let dicArr = data["list"] as? [[String: Any]] else {return}
            for creamDict in dicArr{
                let cream = CreamModel(dict: creamDict)
                self.creams.append(cream)
            }
            finishedCallBack(nil)
        }) { (error) in
            finishedCallBack(error)
        }
    }
}
