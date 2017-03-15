//
//  NetWorkTool.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit
import Alamofire

// MARK: - 请求枚举
enum MethodType: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class NetWorkTool: NSObject {
    // MARK: 通用请求的Manager
    static let defManager: SessionManager = {
        var defHeaders = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders ?? [:]
        let defConf = URLSessionConfiguration.default
        defConf.timeoutIntervalForRequest = 8
        defConf.httpAdditionalHeaders = defHeaders
        return Alamofire.SessionManager(configuration: defConf)
    }()
    
    
    static func requestData(type: MethodType,urlString: String, parameters: [String : Any]? = nil ,succeed:@escaping ((_ result : Any?, _ error: Error?) -> Swift.Void), failure: @escaping ((_ error: Error?)  -> Swift.Void)) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        let headers: HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
        ]
        
        // 2.发送网络数据请求
        NetWorkTool.defManager.request(urlString, method: method, parameters: parameters, headers: headers).responseJSON { (response) in
            
            // 请求失败
            if response.result.isFailure {
                print(response.result.error)
                failure(response.result.error)
                return
            }
            
            // 请求成功
            if response.result.isSuccess {
                // 3.获取结果
                guard let result = response.result.value else {
                    succeed(nil, response.result.error)
                    return
                }
                // 4.将结果回调出去
                succeed(result, nil)
            }
        }
    }
}
